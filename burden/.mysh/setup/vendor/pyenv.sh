# If nvim fails to find python's host,
# Check your execution path and pip package version are compatible with your python.
# Sometimes, pip cache and installation will be corrupted
# when your first installation is shit.(You are noob. R.I.P.)
# Just force-reinstall these messed things.
# This took 2 or 3 hours from me.
#
# pyenv uninstall YOUR_VER2_PYTHON_ENV
# pyenv virtualenv YOUR_VER2_PYTHON_NUM YOUR_VER2_PYTHON_ENV
# pyenv activate YOUR_VER2_PYTHON_ENV
# pip install --no-cache-dir --upgrade --force-reinstall neovim
# pyenv uninstall YOUR_VER3_PYTHON_ENV
# pyenv virtualenv YOUR_VER3_PYTHON_NUM YOUR_VER3_PYTHON_ENV
# pyenv activate YOUR_VER3_PYTHON_ENV
# pip3 install --no-cache-dir --upgrade --force-reinstall neovim
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"


# 2020-05-27 deprecated pyenv
#echo "Loading pyenv.sh"
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#export PATH="$PYENV_ROOT/shims:$PATH"

#if [ -e "$HOME"/.pyenv ]; then
  #echo "pyenv is already installed."
#else
  #$(curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash)
  #$("$HOME"/.mysh/run/neovim_setup.sh)
#fi

#if [ -d "$(pyenv root)""/plugins/pyenv-virtualenv" ]; then
  #echo "pyenv/plugin/virtualenv directory is already there."
#else
  #git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
#fi

#echo "Initializing pyenv"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
