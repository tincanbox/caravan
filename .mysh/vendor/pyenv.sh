echo "  Loading pyenv.sh"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"

if [ type "pyenv" 2>/dev/null ]; then
  echo "  pyenv is already installed."
else
  $(git clone https://github.com/yyuu/pyenv.git ~/.pyenv 2>/dev/null)
fi

if [ -d "$(pyenv root)""/plugins/pyenv-virtualenv" ]; then
  echo "  virtualenv/ directory is already there."
else
  $(git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv 2> /dev/null)
fi

if [ type "pyenv" 2>/dev/null ]; then
  echo "  Initializing pyenv"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
