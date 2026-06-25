#include "FlightGearSender.hpp"
#include "NetFdmPacket.hpp"

#include <FGFDMExec.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>

namespace {
flightgear::NetFdmPacket BuildPacket(JSBSim::FGFDMExec &fdm) {
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
} // namespace

namespace flightgear {
FlightGearSender::FlightGearSender() {
  socketFd_ = socket(AF_INET, SOCK_DGRAM, 0);

  if (socketFd_ < 0) {
    return;
  }

  address_.sin_family = AF_INET;
  address_.sin_port = htons(5500);
  inet_pton(AF_INET, "127.0.0.1", &address_.sin_addr);
}

FlightGearSender::~FlightGearSender() {
  if (socketFd_ >= 0) {
    close(socketFd_);
  }
}

bool FlightGearSender::IsOpen() const { return socketFd_ >= 0; }

bool FlightGearSender::Send(JSBSim::FGFDMExec &fdm) {
  if (!IsOpen()) {
    return false;
  }

  const auto packet = BuildPacket(fdm);
  const auto networkPacket = flightgear::ToNetworkOrder(packet);

  const ssize_t sentBytes =
      sendto(socketFd_, &networkPacket, sizeof(networkPacket), 0,
             reinterpret_cast<const sockaddr *>(&address_), sizeof(address_));

  return sentBytes == static_cast<ssize_t>(sizeof(networkPacket));
}

} // namespace flightgear
//
