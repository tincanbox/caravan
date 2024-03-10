source ~/.mysh/bootstrap.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/build/google-cloud-sdk/google-cloud-sdk/path.zsh.inc' ]; then
  . '~/build/google-cloud-sdk/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/dev/build/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/home/dev/build/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc'
fi

