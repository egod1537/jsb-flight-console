#pragma once

#include "flightgear/FlightGearSender.hpp"
#include <csignal>
#include <memory>

namespace JSBSim {
class FGFDMExec;
}

namespace simulation {
class Simulation {
public:
  Simulation();
  ~Simulation();

  Simulation(const Simulation &) = delete;
  Simulation &operator=(const Simulation &) = delete;

  bool Initialize();
  void Run(const volatile std::sig_atomic_t &running);

private:
  void ConfigurePaths();
  bool LoadAircraft();
  void ConfigureSimulation();
  void ConfigureInitialConditions();
  bool InitializeState();
  void PrintState() const;

  std::unique_ptr<JSBSim::FGFDMExec> fdm_;
  flightgear::FlightGearSender flightGearSender_;
};
} // namespace simulation
