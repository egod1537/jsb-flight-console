.PHONY: configure build fg run clean

configure:
	cmake --preset debug

build:
	cmake --build --preset debug

fg:
	./scripts/run-flightgear.sh

run:
	./scripts/run-console.sh

clean:
	rm -rf build/debug

