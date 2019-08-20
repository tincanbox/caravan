__caravan()
{
  arg="$1"

  #__caravan::member::manager::include_all "command"

  case "$arg" in
    -* | --*)
      echo "$argv[@]"
      ;;

    init | test | install | update | list | clean | status | clear | load | info | help)
      shift

      #"$_CARAVAN_DIR_COMMAND""/""$arg"".sh" $argv[@]
      __caravan::member::manager::include "command/""$arg"".sh"

      if [ $? -eq 0 ]
      then
        "__caravan::command::"${arg} $argv[@]
      else
        __caravan::log "Failed to load command execution file."
        exit 1
      fi

      ;;

    *::*)
      __caravan::log "Contacting members directly is not supported in this state."
      ;;

    "")
      __caravan::log "Needs a command..."
      ;;

    *)
      __caravan::log "Unsupported command: ""$arg"
      ;;
  esac

  return $status
}


__caravan::watch ()
{
  __caravan::log $_CARAVAN_ERROR
}

__caravan::log ()
{
  echo "$1" > /dev/tty
}
