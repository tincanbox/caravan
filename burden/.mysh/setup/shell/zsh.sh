echo "---- Shell:ZSH"

if [ ! -e "$HOME"/.zprezto ]
then
  __caravan::log "Installing Prezto..."
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
  __caravan::log "Theres no .zprezto/init.zsh file."
fi

