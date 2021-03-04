FROM ubuntu:focal

ENV USER dotfiles-tester
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN useradd -ms /bin/bash $USER
RUN set -xe \
	&& apt -y update \
	&& apt -y install sudo locales \
	&&sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
	&& locale-gen

USER root
RUN set -xe \
	&& mkdir /home/$USER/dotfiles \
	&& chown $USER:$USER /home/$USER/dotfiles \
	&& echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER

WORKDIR /home/$USER/dotfiles

USER $USER
ADD --chown=$USER:$USER mkenv.sh /home/$USER/dotfiles/
RUN set -xe && ./mkenv.sh

ADD --chown=$USER:$USER install/packages /home/$USER/dotfiles/install/packages
ADD --chown=$USER:$USER install/packages.sh /home/$USER/dotfiles/install/
RUN set -xe && bash -c 'source .env; ./install/packages.sh'

ADD --chown=$USER:$USER src /home/$USER/dotfiles/src
ADD --chown=$USER:$USER thirdparty /home/$USER/dotfiles/thirdparty
ADD --chown=$USER:$USER install/dotfiles.sh /home/$USER/dotfiles/install/
RUN set -xe \
	&& bash -c 'source .env; ./install/dotfiles.sh'

ADD --chown=$USER:$USER inc /home/$USER/dotfiles/inc
ADD --chown=$USER:$USER bin /home/$USER/dotfiles/bin
ADD --chown=$USER:$USER optimize.sh /home/$USER/dotfiles

RUN set -xe \
	&& ./optimize.sh

ADD --chown=$USER:$USER install/afterparty.sh /home/$USER/dotfiles/install/

WORKDIR /home/$USER

CMD "/usr/bin/bash" \
	"-c" \
	"source /home/$USER/dotfiles/.env; /home/$USER/dotfiles/install/afterparty.sh; zsh -i"
