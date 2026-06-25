#include "simulation/Simulation.hpp"
#include <FGFDMExec.h>
#include <chrono>
#include <csignal>
#include <initialization/FGInitialCondition.h>
#include <iostream>
#include <simgear/misc/sg_path.hxx>
#include <thread>

using FDM = JSBSim::FGFDMExec;
using Clock = std::chrono::steady_clock;

namespace {
constexpr double SIMULATION_HZ = 120.0;
constexpr double DT = 1.0 / SIMULATION_HZ;
constexpr double LOG_INTERVAL_SEC = 1.0;

const std::string BUILD_PATH = "build/debug";
const std::string JSBSIM_ROOT_PATH = BUILD_PATH + "/_deps/jsbsim-src";
const std::string AIRCRAFT_NAME = "c172x";

} // namespace

namespace simulation {
Simulation::Simulation() : fdm_(std::make_unique<JSBSim::FGFDMExec>()) {}

Simulation::~Simulation() = default;

void Simulation::ConfigurePaths() {
  fdm_->SetRootDir(SGPath(JSBSIM_ROOT_PATH));
  fdm_->SetAircraftPath(SGPath("aircraft"));
  fdm_->SetEnginePath(SGPath("engine"));
  fdm_->SetSystemsPath(SGPath("systems"));
}

bool Simulation::LoadAircraft() {
  if (!fdm_->LoadModel(AIRCRAFT_NAME)) {
    std::cerr << "Failed to load " << AIRCRAFT_NAME << '\n';
    return false;
  }

  std::cout << AIRCRAFT_NAME << " loaded\n";
  return true;
}

void Simulation::ConfigureSimulation() { fdm_->Setdt(DT); }

void Simulation::ConfigureInitialConditions() {
  auto ic = fdm_->GetIC();

  ic->SetAltitudeASLFtIC(1000.0);
  ic->SetVcalibratedKtsIC(80.0);

  ic->SetPhiRadIC(0.0);
  ic->SetThetaRadIC(0.0);
  ic->SetPsiRadIC(0.0);
}
bool Simulation::InitializeState() {
  if (!fdm_->RunIC()) {
    std::cerr << "Failed to initialize simulation\n";
    return false;
  }

  std::cout << "Initial altitude: "
            << fdm_->GetPropertyValue("position/h-agl-ft") << " ft\n";
  return true;
}

bool Simulation::Initialize() {
  ConfigurePaths();
  if (!LoadAircraft()) {
    return false;
  }

  ConfigureSimulation();
  ConfigureInitialConditions();

  if (!InitializeState()) {
    return false;
  }

  if (!flightGearSender_.IsOpen()) {
    std::cerr << "Failed to initialize FlightGear sender\n";
    return false;
  }

  if (!keyboardInput_.Initialize()) {
    std::cerr << "Failed to initialize keyboard input\n";
    return false;
  }

  return true;
}

void Simulation::PrintState() const {
  const double simTime = fdm_->GetPropertyValue("simulation/sim-time-sec");
  const double altitude = fdm_->GetPropertyValue("position/h-agl-ft");
  const double airspeed = fdm_->GetPropertyValue("velocities/vc-kts");
  const double pitch = fdm_->GetPropertyValue("attitude/pitch-rad");

  std::cout << "t=" << simTime << " s, altitude=" << altitude
            << " ft, airspeed=" << airspeed << " kt, pitch=" << pitch
            << " rad\n";
}

void Simulation::ApplyControlInput() {
  fdm_->SetPropertyValue("fcs/elevator-cmd-norm", controlInput_.elevator);
  fdm_->SetPropertyValue("fcs/aileron-cmd-norm", controlInput_.aileron);
  fdm_->SetPropertyValue("fcs/rudder-cmd-norm", controlInput_.rudder);
  fdm_->SetPropertyValue("fcs/throttle-cmd-norm", controlInput_.throttle);
}

void Simulation::Run(const volatile std::sig_atomic_t &running) {
  auto nextFrame = Clock::now();
  double nextLogTime = 0.0;

  while (running) {
    nextFrame += std::chrono::duration_cast<Clock::duration>(
        std::chrono::duration<double>(DT));

    if (keyboardInput_.Update(controlInput_)) {
      std::cout << "control" << " elevator=" << controlInput_.elevator
                << " aileron=" << controlInput_.aileron
                << " rudder=" << controlInput_.rudder
                << " throttle=" << controlInput_.throttle << '\n';
    }
    ApplyControlInput();

    if (!fdm_->Run()) {
      std::cerr << "JSBSim simulation stopeed\n";
      break;
    }

    if (!flightGearSender_.Send(*fdm_)) {
      std::cerr << "Failed to send FlightGear packet\n";
    }

    const double simTime = fdm_->GetPropertyValue("simulation/sim-time-sec");

    if (simTime >= nextLogTime) {
      PrintState();
      nextLogTime += LOG_INTERVAL_SEC;
    }

    std::this_thread::sleep_until(nextFrame);
  }
}
} // namespace simulation
