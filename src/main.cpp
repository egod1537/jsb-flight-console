#include "simulation/Simulation.hpp"
#include <csignal>
#include <iostream>

namespace {
volatile std::sig_atomic_t running = 1;
}

void HandleSignal(int) { running = 0; }

int main() {
  std::signal(SIGINT, HandleSignal);
  std::signal(SIGTERM, HandleSignal);

  simulation::Simulation simulation;

  if (!simulation.Initialize()) {
    std::cerr << "Failed to initialize simulation\n";
    return 1;
  }

  simulation.Run(running);
  return 0;
}
