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

if [ -f "$HOME/.mysh/setup/shell/$current_shell.sh" ]; then
  source "$HOME/.mysh/setup/shell/$current_shell.sh"
else
  echo ".mysh cant handle shell:""$current_shell"
  exit 1
fi

if [ ! -e "$HOME/.mysh/extension" ]; then
  mkdir "$HOME/.mysh/extension"
fi

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/.mysh/bin":$PATH
export VISUAL=vim

mysh_bootstrap(){

  echo "Loading .mysh/setup/vendor files."

  for f in ~/.mysh/setup/vendor/*;
  do
    source "${f}"
  done

  source ~/.mysh/setup/common/setup_alias.sh

  # Checks vim plugins
  if [ ! -d ~/.vim/plugged ]; then
    echo "Installing VIM plugins..."
    eval "vim +PlugUpdate +qall"
    eval "python3 ~/.vim/plugged/youcompleteme/install.py --all"
  fi

  echo "Loading User extension files."
  for f in ~/.mysh/extension/*;
  do
    source "${f}"
  done

}
mysh_bootstrap

export XDG_CONFIG_HOME=~/.config
