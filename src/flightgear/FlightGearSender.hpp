#pragma once

#include <netinet/in.h>

namespace JSBSim {
class FGFDMExec;
}

namespace flightgear {
class FlightGearSender {
public:
  FlightGearSender();
  ~FlightGearSender();

  FlightGearSender(const FlightGearSender &) = delete;
  FlightGearSender &operator=(const FlightGearSender &) = delete;

  bool IsOpen() const;
  bool Send(JSBSim::FGFDMExec &fdm);

private:
  int socketFd_ = -1;
  sockaddr_in address_{};
};
} // namespace flightgear
