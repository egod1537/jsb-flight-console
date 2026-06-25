#include "simgear/misc/sg_path.hxx"
#include <FGFDMExec.h>
#include <chrono>
#include <initialization/FGInitialCondition.h>

#include <iostream>
#include <memory.h>
#include <memory>
#include <thread>

namespace {
using FDM = JSBSim::FGFDMExec;
using Clock = std::chrono::steady_clock;

constexpr double SIMULATION_HZ = 120.0;
constexpr double DT = 1.0 / SIMULATION_HZ;
constexpr double LOG_INTERVAL_SEC = 1.0;

const std::string BUILD_PATH = "build/debug";
const std::string JSBSIM_ROOT_PATH = BUILD_PATH + "/_deps/jsbsim-src";
const std::string AIRCRAFT_NAME = "c172x";

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

void RunSimulation(FDM &fdm) {
  auto nextFrame = Clock::now();
  double nextLogTime = 0.0;

  while (true) {
    nextFrame += std::chrono::duration_cast<Clock::duration>(
        std::chrono::duration<double>(DT));

    if (!fdm.Run()) {
      std::cerr << "JSBSim simulation stopeed\n";
      break;
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
  RunSimulation(*fdm);

  return 0;
}
