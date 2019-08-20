echo "Loading zsh configuration"

if [ ! -e "$HOME"/.zprezto ]
then
  __caravan::log "Installing Prezto..."
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
else
  if [ -e "$HOME"/.zprezto/init.zsh ]
  then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  else
    __caravan::log "Theres no .zprezto/init.zsh file."
  fi
fi
