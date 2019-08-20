__caravan::member::manager::include_all()
{
  for file in `find "$_CARAVAN_HOME"/core/"$1"/* -maxdepth 1 -type f`; do
    f="${file##*/}"
    f="${f%*.sh}"
    source "$file"
  done
}

__caravan::member::manager::include()
{
  fp="$_CARAVAN_HOME""/core/""$1"

  if [ ! -e $fp ]
  then
    return 1
    exit
  fi

  source "$fp" >&2

  echo "true"
  return 0
}
