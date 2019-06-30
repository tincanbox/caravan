__caravan::member::manager::include_all()
{
  for file in `find "$_CARAVAN_HOME"/core/"$1"/* -maxdepth 1 -type f`; do
    f="${file##*/}"
    f="${f%*.sh}"
    source "$file"
  done
}


