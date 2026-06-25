#include "flightgear/NetFdmSocket.hpp"
#include <arpa/inet.h>
#include <atomic>
#include <csignal>
#include <filesystem>
#include <netinet/in.h>
#include <sys/socket.h>
#include <unistd.h>

#include "simgear/misc/sg_path.hxx"
#include <FGFDMExec.h>
#include <chrono>
#include <initialization/FGInitialCondition.h>

#include <iostream>
#include <memory.h>
#include <memory>
#include <thread>

namespace {
std::atomic_bool running = true;
void HandleSignal(int) { running = false; }

using FDM = JSBSim::FGFDMExec;
using Clock = std::chrono::steady_clock;

constexpr double SIMULATION_HZ = 120.0;
constexpr double DT = 1.0 / SIMULATION_HZ;
constexpr double LOG_INTERVAL_SEC = 1.0;

const std::string BUILD_PATH = "build/debug";
const std::string JSBSIM_ROOT_PATH = BUILD_PATH + "/_deps/jsbsim-src";
const std::string AIRCRAFT_NAME = "c172x";

int CreateUdpSocket() {
  const int socketFd = socket(AF_INET, SOCK_DGRAM, 0);
  if (socketFd < 0) {
    std::cerr << "Failed to create UDP socket\n";
  }
  return socketFd;
}

sockaddr_in CreateFlightGearAddress() {
  sockaddr_in address{};
  address.sin_family = AF_INET;
  address.sin_port = htons(5500);
  inet_pton(AF_INET, "127.0.0.1", &address.sin_addr);

  return address;
}

flightgear::NetFdmPacket BuildFlightGearPacket(FDM &fdm) {
  flightgear::NetFdmPacket packet{};

  packet.longitude = fdm.GetPropertyValue("position/long-gc-rad");
  packet.latitude = fdm.GetPropertyValue("position/lat-gc-rad");

  packet.altitude = fdm.GetPropertyValue("position/h-sl-ft") * 0.3048;
  packet.agl =
      static_cast<float>(fdm.GetPropertyValue("position/h-agl-ft") * 0.3048);

  packet.phi = static_cast<float>(fdm.GetPropertyValue("attitude/phi-rad"));
  packet.theta = static_cast<float>(fdm.GetPropertyValue("attitude/theta-rad"));
  packet.psi = static_cast<float>(fdm.GetPropertyValue("attitude/psi-rad"));

  return packet;
}

bool SendFlightGearPacket(int socketFd, const sockaddr_in &address,
                          const flightgear::NetFdmPacket &packet) {
  const auto networkPacket = flightgear::ToNetworkOrder(packet);

  const ssize_t sentBytes =
      sendto(socketFd, &networkPacket, sizeof(networkPacket), 0,
             reinterpret_cast<const sockaddr *>(&address), sizeof(address));

  return sentBytes == static_cast<ssize_t>(sizeof(networkPacket));
}

std::unique_ptr<FDM> CreateFDM() { return std::make_unique<FDM>(); }

void ConfigurePaths(FDM &fdm) {
  fdm.SetRootDir(SGPath(JSBSIM_ROOT_PATH));
  fdm.SetAircraftPath(SGPath("aircraft"));
  fdm.SetEnginePath(SGPath("engine"));
  fdm.SetSystemsPath(SGPath("systems"));
}

bool LoadAircraft(FDM &fdm) {
  if (!fdm.LoadModel(AIRCRAFT_NAME)) {
    std::cerr << "Failed to load " << AIRCRAFT_NAME << '\n';
    return false;
  }

  std::cout << AIRCRAFT_NAME << " loaded\n";
  return true;
}

void ConfigureSimulation(FDM &fdm) { fdm.Setdt(DT); }

void ConfigureInitialConditions(FDM &fdm) {
  auto ic = fdm.GetIC();

  ic->SetAltitudeASLFtIC(1000.0);
  ic->SetVcalibratedKtsIC(80.0);

  ic->SetPhiRadIC(0.0);
  ic->SetThetaRadIC(0.0);
  ic->SetPsiRadIC(0.0);
}

bool InitializeSimulation(FDM &fdm) {
  if (!fdm.RunIC()) {
    std::cerr << "Failed to initialize simulation\n";
    return false;
  }

  std::cout << "Initial altitude: " << fdm.GetPropertyValue("position/h-agl-ft")
            << " ft\n";
  return true;
}

void PrintSimulationState(FDM &fdm) {
  const double simTime = fdm.GetPropertyValue("simulation/sim-time-sec");
  const double altitude = fdm.GetPropertyValue("position/h-agl-ft");
  const double airspeed = fdm.GetPropertyValue("velocities/vc-kts");
  const double pitch = fdm.GetPropertyValue("attitude/pitch-rad");

  std::cout << "t=" << simTime << " s, altitude=" << altitude
            << " ft, airspeed=" << airspeed << " kt, pitch=" << pitch
            << " rad\n";
}

void RunSimulation(FDM &fdm, int socketFd,
                   const sockaddr_in &flightGearAddress) {
  auto nextFrame = Clock::now();
  double nextLogTime = 0.0;

  while (running) {
    nextFrame += std::chrono::duration_cast<Clock::duration>(
        std::chrono::duration<double>(DT));

    if (!fdm.Run()) {
      std::cerr << "JSBSim simulation stopeed\n";
      break;
    }

    const auto packet = BuildFlightGearPacket(fdm);
    if (!SendFlightGearPacket(socketFd, flightGearAddress, packet)) {
      std::cerr << "Failed to send FlightGear packet\n";
    }

    const double simTime = fdm.GetPropertyValue("simulation/sim-time-sec");

    if (simTime >= nextLogTime) {
      PrintSimulationState(fdm);
      nextLogTime += LOG_INTERVAL_SEC;
    }

    std::this_thread::sleep_until(nextFrame);
  }
}

} // namespace

int main() {
  std::signal(SIGINT, HandleSignal);
  std::signal(SIGTERM, HandleSignal);

  auto fdm = CreateFDM();
  ConfigurePaths(*fdm);

  if (!LoadAircraft(*fdm)) {
    return 1;
  }

  ConfigureSimulation(*fdm);
  ConfigureInitialConditions(*fdm);

  if (!InitializeSimulation(*fdm)) {
    return 1;
  }

  const int socketFd = CreateUdpSocket();
  if (socketFd < 0) {
    return 1;
  }

  const sockaddr_in flightGearAddress = CreateFlightGearAddress();

  RunSimulation(*fdm, socketFd, flightGearAddress);
  close(socketFd);

  return 0;
}
