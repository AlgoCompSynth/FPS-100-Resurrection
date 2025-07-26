# FPS-100-Resurrection
Software to help resurrect an FPS-100 Array Processor

## Introduction
Usagi Electric <https://www.youtube.com/@UsagiElectric> have acquired
some board sets from an FPS-100 Array Processor and are in the
process of reconstructing it. See
[Trying to Build a PDP-11 Supercomputer – Part 1](https://youtu.be/ufOHzGh-jbs)
for an introduction.

I worked at FPS from 1980-1990 and as part of my job, programmed FPS machines
in Fortran and assembly / microcode. So I'm helping them get the software
pieces up and running.

To make this usable in a variety of places, I'm implementing it as a
container image and `bash` scripts. Using a container host like Podman
or Docker, that image can be built and run on Windows, MacOS or Linux in an
environment ranging from a data center down to a decent-sized Raspberry
Pi 4 or 5.

## Usage

The only tested version of this project currently runs on a Raspberry Pi
PiOS 64-bit system with at least 2 GB of RAM. After cloning this repo,
`cd Desktop-PiOS` and follow the directions in `README.md`.

A version for Windows Subsystem for Linux and a Docker container version
are on the road map. Watch this space!
