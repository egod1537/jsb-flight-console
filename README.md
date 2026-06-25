# JSB Flight Console

A simple console application that simulates aircraft flight with JSBSim and visualizes the results in FlightGear.

## Supported Environment

- Ubuntu 24.04 LTS

## Prerequisites

- C++20 compiler
- CMake 3.28 or later
- Ninja
- Git
- FlightGear AppImage

If the required build tools are not installed, install them on Ubuntu 24.04 with:

```bash
sudo apt update
sudo apt install build-essential cmake ninja-build git
```

Place the FlightGear AppImage at the following path and make sure it is executable:

```text
.deps/flightgear/flightgear.AppImage
```

## Build

```bash
make configure
make build
```

`make configure` downloads the JSBSim source and configures a Debug build.

## Run

Open two terminals and run the following commands in order.

In the first terminal, start FlightGear:

```bash
make fg
```

In the second terminal, start the simulation:

```bash
make run
```

The simulation runs JSBSim's Cessna 172 (`c172x`) model at 120 Hz. The initial altitude is 1,000 ft and the initial airspeed is 80 kt. Aircraft position and attitude data are sent to FlightGear over UDP at `127.0.0.1:5500`.

FlightGear visualizes the state received from JSBSim without using its own flight dynamics model. The simulation console periodically displays information such as altitude, airspeed, and pitch.

Press `Ctrl+C` in each terminal to stop the programs.

## Clean

```bash
make clean
```

This removes the `build/debug` directory containing the Debug build artifacts.
