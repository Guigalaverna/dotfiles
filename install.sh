#!/bin/bash

# Update Repository

sudo apt-get update

# Installing dependencies

sudo apt-get install git zsh vim

# Copying files to /home

cp .zshrc ~
cp .vimrc ~

echo "Dotfiles installed"
echo ""
echo "Have a nice day!"
