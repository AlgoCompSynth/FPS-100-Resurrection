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
Dockerfile and `bash` scripts, a way to build a Docker image that can
be run with Windows, MacOS or Linux on environments ranging from a data
center down to a decent-sized Raspberry Pi 4 or 5. In theory, you
should be able to bring this up by installing Docker on your machine,
cloning this repository, and typing

```
docker build -t fps-100-resurrection .
docker run -it fps-100-resurrection
```
