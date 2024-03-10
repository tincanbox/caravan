
echo "---- Language::Haskell"

is_installed=$( test -d ~/.ghcup && echo 1 || echo 0)

case $is_installed in
  0)
    echo "Installing GHCup for Haskell"
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org \
      | \
      BOOTSTRAP_HASKELL_NONINTERACTIVE=1 \
      BOOTSTRAP_HASKELL_GHC_VERSION=latest \
      BOOTSTRAP_HASKELL_CABAL_VERSION=latest \
      BOOTSTRAP_HASKELL_INSTALL_STACK=1 \
      BOOTSTRAP_HASKELL_INSTALL_HLS=1 \
      BOOTSTRAP_HASKELL_ADJUST_BASHRC=P sh
  ;;
  1)
  ;;
esac

# Loads env file.
if [ -f ~/.ghcup/env ]; then
  source ~/.ghcup/env
fi

