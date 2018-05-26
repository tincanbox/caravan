# Add...
# source ~/.mysh/bootstrap.sh
# in your *rc file.

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$HOME/.mysh/bin":$PATH

mysh_bootstrap(){

  local current_shell

  current_shell=`basename $SHELL`
  echo "Using Shell: ""$current_shell"

  if [ -f "$HOME/.mysh/shell/$current_shell.sh" ]; then
    source "$HOME/.mysh/shell/$current_shell.sh"
  fi

  for f in ~/.mysh/vendor/*;
  do
    source "${f}"
  done

  source ~/.mysh/alias.sh
}
mysh_bootstrap;

export XDG_CONFIG_HOME=~/.config
