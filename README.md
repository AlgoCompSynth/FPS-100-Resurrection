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

1. Container hosting - you can use either
[Docker](https://www.docker.com) or
[Podman](https://podman.io). I test on both, and you can use Windows, MacOS
or Linux. The image should work on either an `x86_64`/`amd64` host or an
`aarch64`/`arm64` host. I have a Windows 11 x86_64 host machine, a
[Universal Blue Bluefin DX](https://projectbluefin.io) Linux x86_64 host machine,
and a 16 GB Raspberry Pi 5 to test on, but no Macintosh of any kind.
There are desktop editions of both Docker and Podman, but I only test
on the command line versions.

    I recommend Podman hosting rather than Docker, but either will work. See
    [Podman Installation Instructions](https://podman.io/docs/installation)
    for the details. Note that if you're using a Raspberry Pi with the standard
    PiOS based on Debian `bookworm`, you should use the Debian install instructions.

3. Building the image - first, get to a Linux command line in your container
   host and clone this repository:

    ```
    git clone https://github.com/AlgoCompSynth/FPS-100-Resurrection.git
    cd FPS-100-Resurrection
    ```

    Next, choose your hosting service. Edit the file `set_envars` and
    remove the comment designator "#" from the `HOST_SERVICE=` line
    you want to use, and add one at the beginning of the other one.
    The default is Podman, so you can skip this step if you're using Podman.

    ```
    export HOST_SERVICE=podman
    #export HOST_SERVICE=docker
    echo "HOST_SERVICE: $HOST_SERVICE"

    export IMAGE_NAME=fps-100-resurrection-img
    export CONTAINER_NAME=fps-100-resurrection
    ```

    To build the image and run it in a new container, type

    ```
    cd Operations
    ./1-build-and-run.sh
    ```

    This takes a bit of time; on my large machine - 8 core / 16 thread
    `(Intel(R) Core(TM) i7-10700F CPU @ 2.90GHz` - it takes about 5
    minutes, most of which is a fully parallel compile of all of
    [OpenSIMH](https://opensimh.org/).

    On my Raspberry PI 5 it takes about 22 minutes.

    ```
    > ./1-build-and-run.sh 
    HOST_SERVICE: podman
    Quietly building image fps-100-resurrection-img
    In case of errors consult logfile ../Logfiles/build-and-run.log

    real	22m27.438s
    user	27m8.972s
    sys 	1m50.223s

    Images:

    REPOSITORY                          TAG         IMAGE ID      CREATED         SIZE
    localhost/fps-100-resurrection-img  build       7020037f9735  31 seconds ago  2.16 GB
    docker.io/library/ubuntu            24.04       b24db5c17bb8  6 days ago      103 MB

    Running fresh container fps-100-resurrection
    Ignore any 'No such container' messages

    To run a command as administrator (user "root"), use "sudo <command>".
    See "man sudo_root" for details.


    ~ 
    ⬢ [podman] >
    ```

    The script builds a container image with the fully-qualified name
    `localhost/fps-100-resurrection-img:build`, then runs it in a
    container named `fps-100-resurrection`. If that container exists
    it will be replaced.

    You are logged into an Ubuntu 24.04 LTS `bash` command line as
    user `array`, password `processor`. You have `sudo` privileges
    so you can install packages, etc.. To leave the container, type
    `exit<enter>`. You will see

    ```
    exit

    Containers:

    CONTAINER ID  IMAGE                                     COMMAND        CREATED         STATUS                             PORTS       NAMES
    10fcbb176a27  localhost/fps-100-resurrection-img:build  /usr/bin/bash  11 minutes ago  Exited (0) Less than a second ago              fps-100-resurrection

    Finished
    ```

    Once the image is built, running the script again will not rebuild it,
    so the container will start faster. However, any existing container
    will be replaced by a new one, erasing any data you stored in the
    first one!

4. What's on the image -

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
    - The FPS-100 host-based tools downloaded from 
      <https://bitsavers.org/bits/FloatingPointSystems/FPS100/fps100sw.zip> in
      `/usr/local/src/fps100sw`.

5. Export-import operations (new!) -

    You can now save your work in a container by _exporting_ it to an image tarball,
    then continue where you left off by _importing_ the tarball to a new image
    and running that image in a new container.

    Script `2-export-container.sh` creates the tarball:

    ```
    > ./2-export-container.sh 
    HOST_SERVICE: podman
    Exporting container fps-100-resurrection to image tarball fps-100-resurrection-img.tgz

    real	1m51.774s
    user	1m48.208s
    sys 	0m5.463s

    Exports:

    928M	fps-100-resurrection-img.tgz

    Finished
    ```

    Script `3-import-and-run.sh` imports the image tarball to a new image and runs
    the image in a new container. The original image that `1-build-and-run.sh` created
    is left exactly the way it was built, in case you want to start over!

    ```
    > ./3-import-and-run.sh 
    HOST_SERVICE: podman
    Importing image tarball fps-100-resurrection-img.tgz to image fps-100-resurrection-img:latest
    Getting image source signatures
    Copying blob a970917f12fd done  
    Copying config d5841ecd95 done  
    Writing manifest to image destination
    Storing signatures
    sha256:d5841ecd956068f36b98daf62796b855eeda140353c79f3c0d877056df5c2f9e

    Images:

    REPOSITORY                          TAG         IMAGE ID      CREATED         SIZE
    localhost/fps-100-resurrection-img  latest      d5841ecd9560  7 minutes ago   2.16 GB
    localhost/fps-100-resurrection-img  build       7020037f9735  29 minutes ago  2.16 GB
    docker.io/library/ubuntu            24.04       b24db5c17bb8  6 days ago      103 MB

    Running fresh container fps-100-resurrection
    Ignore any 'No such container' messages
    fps-100-resurrection

    To run a command as administrator (user "root"), use "sudo <command>".
    See "man sudo_root" for details.


    ~ 
    ⬢ [podman] >
    ```

    In the above "images:" list, the tag "build" is the image
    that the first script built, and the tag "latest" is the
    image you are running at the prompt, imported from the
    image tarball that the second script exported.
