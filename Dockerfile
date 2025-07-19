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
  git \
  lsb-release \
  lynx \
  plocate \
  speedtest-cli \
  sudo \
  time \
  tree \
  unzip \
  vim \
  wget \
  && apt-get clean

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
