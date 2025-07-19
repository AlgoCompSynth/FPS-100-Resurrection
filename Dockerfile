FROM ubuntu:24.04
LABEL org.opencontainers.image.authors="znmeb@algocompsynth.com"

# install system software
RUN apt-get update \
  && apt-get install -qqy --no-install-recommends \
  apt-file \
  bash-completion \
  build-essential \
  curl \
  file \
  gfortran \
  git \
  lsb-release \
  lynx \
  ninja-build \
  plocate \
  speedtest-cli \
  sudo \
  time \
  tree \
  unzip \
  vim \
  wget

# set up search databases
RUN updatedb > /dev/null 2>&1 \
  && apt-file update > /dev/null 2>&1

# install OpenSIMH
WORKDIR /usr/local/src/
RUN git clone https://github.com/open-simh/simh.git \
  && cd simh \
  && sh .travis/deps.sh linux 2>&1 \
    | tee /usr/local/src/deps.log \
  && cmake/cmake-builder.sh --parallel --flavor ninja 2>&1 \
    | tee /usr/local/src/cmake-builder.log

# define non-root user
RUN useradd \
  --comment "FPS-100 user" \
  --create-home \
  --groups sudo \
  --shell /usr/bin/bash \
  --user-group \
  array && \
  echo "array:processor" | chpasswd 

WORKDIR /home/array
USER array

ENTRYPOINT ["/usr/bin/bash"]
