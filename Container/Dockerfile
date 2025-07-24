FROM docker.io/library/debian:bookworm-backports
LABEL org.opencontainers.image.authors="znmeb@algocompsynth.com"
ENV DEBIAN_FRONTEND=noninteractive

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
  man-db \
  plocate \
  speedtest-cli \
  sudo \
  time \
  tree \
  unzip \
  vim \
  wget

# install Xpra
RUN rm -f "/usr/share/keyrings/xpra.asc" \
  && wget -O "/usr/share/keyrings/xpra.asc" \
    https://xpra.org/xpra.asc \
  && rm -f "/etc/apt/sources.list.d/xpra.sources" \
  && wget -O "/etc/apt/sources.list.d/xpra.sources" \
    https://raw.githubusercontent.com/Xpra-org/xpra/master/packaging/repos/bookworm/xpra.sources \
  && apt-get update -qq \
  && apt-get install -qqy xpra

# define working directory
WORKDIR /opt

# clone the PiDP-11 repo
RUN git clone https://github.com/obsolescence/pidp11.git

# copy the hacked installer
COPY hacked_install.sh /opt/pidp11/install/

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

# define non-root user
RUN useradd \
  --comment "PiDP-11 user" \
  --create-home \
  --groups sudo \
  --shell /usr/bin/bash \
  --user-group \
  pi && \
  echo "pi:FPS-100" | chpasswd 

# passwordless sudo for pi
RUN echo "pi ALL=(ALL) NOPASSWD: ALL" \
  >> /etc/sudoers.d/010_pi-nopasswd

# set up search databases
RUN updatedb > /dev/null 2>&1 \
  && apt-file update > /dev/null 2>&1 \
  && mandb > /dev/null 2>&1

USER pi

# install!
WORKDIR /opt/pidp11/install/
RUN ./hacked_install.sh

WORKDIR /home/pi

CMD ["/usr/bin/bash"]
