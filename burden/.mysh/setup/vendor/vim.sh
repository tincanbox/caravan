
echo "---- Tool::VIM"

if type "nvim" 2>&1 1>/dev/null; then
  echo "Loading nvim config"
  alias vim='nvim'
  export NVIM_LISTEN_ADDRESS="$HOME/.vim/log/listen"
  export NVIM_PYTHON_LOG_FILE="$HOME/.vim/log/pylog"
  export NVIM_PYTHON_LOG_LEVEL=DEBUG
fi

#"$HOME"/.pyenv/bin/pyenv install 2.7.8
#"$HOME"/.pyenv/bin/pyenv install 3.7.3
#
#"$HOME"/.pyenv/bin/pyenv virtualenv 2.7.8 neovim2
#"$HOME"/.pyenv/bin/pyenv virtualenv 3.7.3 neovim3

