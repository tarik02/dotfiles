#!/usr/bin/env bash

set -e

mkdir -p .cache/tester/zinit

docker build -t dotfiles-try .

docker run \
	-it \
	-v $(pwd)/.cache/tester/zinit:/home/dotfiles-tester/.zinit \
	dotfiles-try
