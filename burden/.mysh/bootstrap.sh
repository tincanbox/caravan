# Add...
# source ~/.mysh/bootstrap.sh
# in your *rc file.
#

current_shell=`basename $SHELL`
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

  vim +PlugInstall +qall > /dev/null
}
mysh_bootstrap

export XDG_CONFIG_HOME=~/.config
