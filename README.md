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

## Usage

The only tested version of this project currently runs on a Raspberry Pi
PiOS 64-bit system with at least 2 GB of RAM. ***After cloning this repo,
`cd Desktop-PiOS` and follow the directions in `README.md`.***

## Update 2025-12-30

There has been an uptick in the project activity over the holidays and
I'm spending some time on this again. Since the last commit I've acquired
an 8 GB Pi 4 and the Raspberry Pi OS is now based on Debian `trixie`
rather than `bookworm`. I'm pleased to say that the install worked on
the Pi 4 with `trixie`, so I'm going to release this as v1.0.0 and
open the issues up.

I'm particularly interested at the moment in any relevant documentation
that isn't currently being downloaded. Please open issues for such
documents and I'll add them to the download script.
