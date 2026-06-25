#pragma once

namespace control {
struct ControlInput {
  double elevator = 0.0;
  double aileron = 0.0;
  double rudder = 0.0;
  double throttle = 0.0;
};
} // namespace control
