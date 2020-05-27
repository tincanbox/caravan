
# 2020-05-27 deprecated rbenv
#echo "Loading rbenv.sh"

#export RBENV_ROOT="$HOME/.rbenv"
#export PATH="${RBENV_ROOT}/bin:$PATH"

#if type "rbenv" > /dev/null; then
  #echo "rbenv is already installed."
#else
  #$(git clone https://github.com/rbenv/rbenv.git "${RBENV_ROOT}" 2>/dev/null)
#fi

#if [ -d "${RBENV_ROOT}""/plugins" ]; then
  #echo "rbenv/plugins directory is already there."
#else
  #mkdir -p "${RBENV_ROOT}""/plugins"
  #$(git clone https://github.com/rbenv/ruby-build.git "${RBENV_ROOT}""/plugins/ruby-build" 2>/dev/null)
#fi

## rbenv
#eval "$(rbenv init -)"
