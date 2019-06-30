__caravan::member::janitor::clean_all_backup () {
  local status
  status=$(find "$HOME"/.*.crvnbk -type l | xargs rm)
  __caravan::log "s"$status
  status=$(find "$HOME"/.config/.*.crvnbk -type l | xargs rm)
  __caravan::log "s"$status
  return $status
}

__caravan::member::janitor::refrain () {
  $(mv $1 "$1""."$(date +%s%3N)".crvnbk")
}
