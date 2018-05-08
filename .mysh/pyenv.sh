if ! type "pyenv" > /dev/null; then
  git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

if [ -d "$HOME/.pyenv" ]; then
  if [ -d "$HOME/.pyenv/bin" ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
  else
    export PATH="$HOME/.pyenv/shims:$PATH"
  fi
  if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init - --no-rehash)"
    eval "$(pyenv virtualenv-init -)"
  fi
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
