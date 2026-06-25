# JSB Flight Console

JSBSim으로 항공기 비행을 시뮬레이션하고, 그 결과를 FlightGear 화면에 표시하는 간단한 콘솔 프로그램입니다.

## 준비 사항

- C++20 컴파일러
- CMake 3.28 이상
- Ninja
- FlightGear AppImage

FlightGear AppImage는 아래 경로에 실행 가능한 상태로 배치합니다.

```text
.deps/flightgear/flightgear.AppImage
```

## 빌드

```bash
make configure
make build
```

`make configure` 실행 시 JSBSim 소스를 받아 Debug 빌드 환경을 구성합니다.

## 실행

터미널 두 개를 열고 다음 순서로 실행합니다.

첫 번째 터미널에서 FlightGear를 실행합니다.

```bash
make fg
```

두 번째 터미널에서 시뮬레이션을 실행합니다.

```bash
make run
```

시뮬레이션은 JSBSim의 Cessna 172(`c172x`) 모델을 120 Hz로 구동합니다. 초기 고도는 1,000 ft, 초기 속도는 80 kt이며, 항공기 위치와 자세를 UDP `127.0.0.1:5500`으로 FlightGear에 전달합니다.

FlightGear는 자체 비행 모델을 사용하지 않고 JSBSim에서 받은 상태를 시각화합니다. 시뮬레이션 콘솔에는 고도, 속도, 피치 등의 상태가 주기적으로 출력됩니다.

종료하려면 각 터미널에서 `Ctrl+C`를 누릅니다.

## 정리

```bash
make clean
```

Debug 빌드 결과가 저장된 `build/debug` 디렉터리를 삭제합니다.
