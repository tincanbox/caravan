#!/bin/sh
echo "---- Shell:ZSH"

if [ ! -d "$HOME"/.zprezto ]
then
  echo "  Installing Prezto..."
  ls -la
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" 2> /dev/null
  done
fi

if [ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]
then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
else
  echo "  Theres no .zprezto/init.zsh file."
fi

