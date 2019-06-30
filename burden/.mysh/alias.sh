# Load with bootstrap.sh
if [ "$(uname)" = 'Darwin' ]; then
  export LSCOLORS=xbfxcxdxbxegedabagacad
  alias ls='ls -G'
else
  #eval `dircolors ~/.colorrc`
  alias ls='ls -la --color=auto'
fi
