# Add...
# source ~/.mysh/bootstrap.sh
# in your *rc file.
#

if test -n "$ZSH_VERSION"; then
  current_shell=zsh
elif test -n "$BASH_VERSION"; then
  current_shell=bash
elif test -n "$KSH_VERSION"; then
  current_shell=ksh
elif test -n "$FCEDIT"; then
  current_shell=ksh
elif test -n "$PS3"; then
  current_shell=unknown
else
  current_shell=sh
fi

echo "Using Shell: ""$current_shell"

if [ -f "$HOME/.mysh/shell/$current_shell.sh" ]; then
  source "$HOME/.mysh/shell/$current_shell.sh"
else
  echo ".mysh cant handle shell:""$current_shell"
  exit 1
fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/.mysh/bin":$PATH
export VISUAL=vim

mysh_bootstrap(){

  echo "Loading .mysh/vendor files."

  for f in ~/.mysh/vendor/*;
  do
    source "${f}"
  done

  source ~/.mysh/alias.sh

  if [ ! -e ~/.vim/plugged ]; then
    echo "Installing VIM plugins..."
    eval "vim +PlugUpdate +qall"
    if [ -e ~/.vim/plugged/youcompleteme/install.py ]; then
      eval "python3 ~/.vim/plugged/youcompleteme/install.py --all"
    fi
  fi

}
mysh_bootstrap

export XDG_CONFIG_HOME=~/.config
