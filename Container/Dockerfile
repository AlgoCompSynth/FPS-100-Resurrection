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

# define working directory
WORKDIR /usr/local/src/

# install starship
RUN curl --silent --show-error --remote-name \
  https://starship.rs/install.sh \
  && chmod +x install.sh \
  && ./install.sh --yes > /dev/null \
  && rm --force ./install.sh \
  && echo 'eval "$(starship init bash)"' >> /etc/skel/.bashrc

# download FPS-100 host software source
RUN wget --quiet \
  https://bitsavers.org/bits/FloatingPointSystems/FPS100/fps100sw.zip \
  && unzip fps100sw.zip \
  && rm --force fps100sw.zip \
  && chmod o+rx fps100sw \
  && chmod go+r fps100sw/*

# install OpenSIMH
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

# set up search databases
RUN updatedb > /dev/null 2>&1 \
  && apt-file update > /dev/null 2>&1

WORKDIR /home/array
USER array
RUN git clone https://github.com/obsolescence/pidp11.git

CMD ["/usr/bin/bash"]
