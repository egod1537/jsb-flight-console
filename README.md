# JSB Flight Console

A real-time flight simulation console that runs JSBSim and visualizes the aircraft state in FlightGear.

The user can control a Cessna 172 with the keyboard while JSBSim calculates the flight dynamics at 120 Hz.

## Environment

* Ubuntu 24.04 LTS
* C++20 compiler
* CMake 3.28 or later
* Ninja
* Git
* FlightGear AppImage

## Installation

Install the required build tools:

```bash
sudo apt update
sudo apt install -y build-essential cmake ninja-build git
```

Download the Linux x86_64 AppImage from the [official FlightGear download page](https://www.flightgear.org/download/).

Create the dependency directory:

```bash
mkdir -p .deps/flightgear
```

Move the downloaded AppImage into the project and rename it:

```bash
mv ~/Downloads/<downloaded-flightgear-file>.AppImage \
  .deps/flightgear/flightgear.AppImage
```

Make the AppImage executable:

```bash
chmod +x .deps/flightgear/flightgear.AppImage
```

## Build

Configure the project:

```bash
make configure
```

Build the application:

```bash
make build
```

The configure step automatically downloads the required JSBSim source code.

## Run

Open two terminals.

Start FlightGear in the first terminal:

```bash
make fg
```

Wait until FlightGear finishes loading.

Start the JSBSim simulation in the second terminal:

```bash
make run
```

Press `Ctrl+C` in each terminal to stop the programs.

## Controls

| Key | Action            |
| --- | ----------------- |
| `W` | Pitch down        |
| `S` | Pitch up          |
| `A` | Roll left         |
| `D` | Roll right        |
| `Q` | Yaw left          |
| `E` | Yaw right         |
| `R` | Increase throttle |
| `F` | Decrease throttle |

Each key press changes the corresponding normalized control input by `0.05`.

## Simulation Settings

* Aircraft: Cessna 172 (`c172x`)
* Simulation frequency: 120 Hz
* Initial altitude: 1,000 ft above sea level
* Initial calibrated airspeed: 80 kt
* FlightGear UDP address: `127.0.0.1:5500`

