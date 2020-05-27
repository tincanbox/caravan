if type "nvim" 2>&1 1>/dev/null; then
  echo "Loading nvim config"
  alias vim='nvim'
  let g:python3_host_prog = "/usr/bin/python3"
  export NVIM_LISTEN_ADDRESS="$HOME/.vim/log/listen"
  export NVIM_PYTHON_LOG_FILE="$HOME/.vim/log/log"
  export NVIM_PYTHON_LOG_LEVEL=DEBUG
fi
