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

## Usage

1. Container hosting - you can use either
[Docker](https://www.docker.com) or
[Podman](https://podman.io). I test on both, and you can use Windows, MacOS
or Linux. The image should work on either an `x86_64`/`amd64` host or an
`aarch64`/`arm64` host. I have a Windows 11 x86_64 host machine, a
[Universal Blue Bluefin DX](https://projectbluefin.io) Linux x86_64 host machine,
and a 16 GB Raspberry Pi 5 to test on, but no Macintosh of any kind.
There are desktop editions of both Docker and Podman, but I only test
on the command line versions.

2. Building the image - first, clone this repository:

    ```
    git clone https://github.com/AlgoCompSynth/FPS-100-Resurrection.git
    cd FPS-100-Resurrection
    ```

    You will see two scripts, `docker-build.sh` and `podman-build.sh`.
    Choose the one that matches your host - for a Docker host, type

    ```
    ./docker-build.sh
    ```

    and for Podman

    ```
    ./podman-build.sh
    ```

    This takes a bit of time; on my large machine - 8 core / 16 thread
    `(Intel(R) Core(TM) i7-10700F CPU @ 2.90GHz` - it takes about 5
    minutes, most of which is a fully parallel compile of all of
    [OpenSIMH](https://opensimh.org/).

    After building the image, the script will `docker run` or `podman run`
    it. This deletes any existing container and creates a new one named
    `docker-fps-100` or `podman-fps-100`.

    You will be at an Ubuntu 24.04 LTS Linux `bash` prompt. The whole
    run will look something like this:

    ```
    ❯ ./podman-build.sh 
    Quietly building fps-100-resurrection Podman image

    real	4m53.498s
    user	18m36.397s
    sys	1m12.380s

    REPOSITORY                      TAG         IMAGE ID      CREATED       SIZE
    localhost/fps-100-resurrection  latest      7e98fe5487ad  1 second ago  2.12 GB
    docker.io/library/ubuntu        24.04       65ae7a6f3544  5 days ago    80.6 MB

    Running fresh 'podman-fps-100' container
    Ignore any 'No such container' messages
    To run a command as administrator (user "root"), use "sudo <command>".
    See "man sudo_root" for details.

    array@898cf823c6d7:~$
    ```

    At this point, you are logged into the container as user `array`,
    password `processor`. You are in the `sudo` group so you can 
    install packages, etc. To leave the container, type `exit`.

    Once the image is built, running the script again will not rebuild it,
    so the container will start faster. However, at the moment, you get
    a fresh container every time. Future versions will have a save and
    restart script so you can exit the container, save its filesystem,
    and start it up again where you left off.

3. What's on the image -

    - Ubuntu 24.04 LTS Linux, with some command line utilities I can't
      live without,
    - Enough build tools to build all the OpenSIMH simulators,
    - `gfortran`, which may be able to compile the FPS utilities with
      some clever hacks,
    - a clone of the
      [OpenSIMH GitHub repository](https://github.com/open-simh/simh.git)
      and all of the OpenSIMH simulators as built with this process:
      <https://github.com/open-simh/simh/blob/master/README-CMake.md#cmake-builder-scripts>.
      The clone is in `/usr/local/src/simh` and the simulators in
      `/usr/local/src/simh/BIN`, and
    - The FPS-100 host-based tools as downloaded from 
      <https://bitsavers.org/bits/FloatingPointSystems/FPS100/fps100sw.zip> in
      `/usr/local/src/fps100sw`.

4. Next steps - For me, the two immediate next steps are to test on the
Raspberry Pi 5 and get the save / restart functionality working. Once
that's done I'm going to release this for contributions.

My end goal here is to build a simulated PDP-11 running RT-11 or RSX-11 M,
learn how to use the OS, and then get all the FPS software compiled and
running, ***including the FPS-100 simulator and the math libraries running
on it.*** I've never used a PDP-11; by the time I got to FPS we were using
VAX 11/780s running VMS for our daily work. And I've never used `OpenSIMH`
or its predecessor `simh`.

So I'm especially looking for contributions in that general direction.
I do have copies of all the relevant manuals.
