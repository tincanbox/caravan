__caravan::command::init()
{
  user_home_path="$HOME""/"

  __caravan::log "$_CARAVAN_DIR_BURDEN"
  __caravan::log "Linking components..."
  for linking_component in ".mysh" ".vim" ".vimrc" ".bashrc" ".zshrc" ".zpreztorc" ".colorrc" ".eslintrc.json" "tsconfig.json"
  do
    linking_path="$_CARAVAN_DIR_BURDEN""/""$linking_component"
    linking_dest_path="$HOME""/""$linking_component"
    if [ -e $linking_dest_path ]
    then
      __caravan::member::janitor::refrain "$linking_dest_path"
    fi

    # Creating link
    $(ln -s "$linking_path" "$linking_dest_path")
    __caravan::log "$linking_component"" Linked"

  done

  # vim and nvim
  __caravan::log "Linking nvim dot-config..."

  # Checking .config dir
  if [ ! -d "$user_home_path"".config" ]
  then
    __caravan::log "making .config dir"
    mkdir "$user_home_path"".config"
  fi

  if [ -e "$user_home_path"".config/nvim" ]
  then
    __caravan::log "backing up .config/nvim dir"
    __caravan::member::janitor::refrain "$user_home_path"".config/nvim"
  fi

  $(ln -s "$_CARAVAN_DIR_BURDEN""/.vim" "$user_home_path"".config/nvim")
  $(cat "$_CARAVAN_DIR_BURDEN""/.vimrc" > "$user_home_path"".config/nvim/init.vim")

}