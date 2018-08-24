
code="$HOME/.mysh/bin"
for file in git-completion.bash git-prompt.sh; do
  if [ -e "${code}/${file}" ]; then
    :
  else
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/${file} -O ${code}/${file}
  fi
done

source "${code}/git-completion.bash"
source "${code}/git-prompt.sh"

# Git Prompt
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUPSTREAM=auto
export PS1="\[\033[1;32m\]\$(date +%Y/%m/%d_%H:%M:%S)\[\033[0m\] \[\033[33m\]\u@\H:\w\[\033[0m\]\[\033[36m\]\$(__git_ps1)\[\033[00m\]\n\$ "
