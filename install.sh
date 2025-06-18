#!/usr/bin/env bash

# Install the stow
sudo nala install -y stow

# Install the dotfiles
stow -D .
stow .
