#pragma once

#include "control/ControlInput.hpp"
#include <termios.h>

namespace control {
class KeyboardInput {
public:
  KeyboardInput() = default;
  ~KeyboardInput();

  KeyboardInput(const KeyboardInput &) = delete;
  KeyboardInput &operator=(const KeyboardInput &) = delete;

  bool Initialize();
  bool Update(ControlInput &input);

private:
  termios originalTerminal_{};
  bool initialized_ = false;
};
} // namespace control
