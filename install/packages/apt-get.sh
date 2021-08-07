#!/usr/bin/env bash

set -e

sudo apt -y update
sudo apt -y install \
	git \
	zsh \
	unzip \
	tmux \
	fasd \
	wget \
	curl \
	vim \
	htop \
	gcc \
	g++ \
	build-essential \
	make \
	libncurses-dev
