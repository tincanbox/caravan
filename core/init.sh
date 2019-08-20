__caravan()
{
  arg="$1"

  __caravan::member::manager::include_all "command"

  case "$arg" in
    -* | --*)
      echo "$argv[@]"
      ;;

    init | test | install | update | list | clean | status | clear | load | info | help)
      shift

      #"$_CARAVAN_DIR_COMMAND""/""$arg"".sh" $argv[@]
      __caravan::command::test
      $("__caravan::command::""$arg" $argv[@] )

      ;;

    *::*)
      echo "Contacting members directly is not supported in this state."
      ;;

    "")
      echo "Needs a command..."
      ;;

    *)
      echo "Unsupported command was given: ""$arg"
      ;;
  esac

  return $status
} 2> "$_CARAVAN_HOME"/log/err.log


__caravan::watch_error ()
{
  __caravan::log $_CARAVAN_ERROR
}

__caravan::log ()
{
  echo "$1" > /dev/tty
}
