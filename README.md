# Building Ring Using GitHub Workflows

A simple workflow to build the Ring programming language from source code and run the tests.

The workflows (`.github/workflows`)

* `using_ubuntu.yml` : Ubuntu (GCC) - Ring 
* `using_macos.yml` : macOS (Clang - Apple Silicon) - Ring 
* `using_ubuntu_ringqt6.yml` : Ubuntu (GCC) - Ring + RingQt6
* `using_macos_ringqt6.yml` : macOS (Clang - Apple Silicon) - Ring + RingQt6

The first two workflows build Ring and test it (steps 1 and 2 below).
The `*_ringqt6.yml` workflows do the same and also test RingQt6 (step 3).

Each workflow

1. Builds Ring from the source code (and runs the Ring tests)
2. Tests RingPM (`ringpm install firstpackage from mahmoudfayed`)
3. Tests RingQt6
	* Installs the package : `ringpm install ringqt6`
	* Installs Qt 6 : `installdeps_ubuntu_qt6.sh` (Ubuntu) or `installdeps_macos_qt6.sh` (macOS - Homebrew `qt`)
	* Builds RingQt6 from the source code (`extensions/ringqt6`) : Core, Light and Full
	* Tests each build using `testqt6core.ring`, `testqt6light.ring` and `testqt6.ring`
	  (Using `QT_QPA_PLATFORM=offscreen`, no display is required)

Notes

* The RingQt6 steps are independent (a failure in one build doesn't stop the next ones), each build is tested after building it.
* Ring itself contains RingQt (Qt 5), the `ringqt6` package replaces the Qt classes in `libraries/guilib` and the
  RingQt6 libraries (`libringqt*.so` or `libringqt*.dylib`) are copied to `ring/lib`.
* The packages (`ringqt6`, `ringqt6runtime`, `qt612runtime`, `qt612qmlruntime`) must be available in the RingPM registry.
* The workflows can be started manually (`workflow_dispatch`).
