#!/usr/bin/osascript

tell application "iTerm"
  set term to (make new terminal)
  tell term
    set itunes_session to (make new session at the end of sessions)
    tell itunes_session
      exec command "~/bin/iTunes"
    end tell
  end tell
  activate
end tell