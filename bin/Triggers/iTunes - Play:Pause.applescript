#!/usr/bin/osascript

tell application "iTunes"
  if player state is stopped then
    play
  else if player state is paused then
    play
  else
    pause
  end if
end tell
