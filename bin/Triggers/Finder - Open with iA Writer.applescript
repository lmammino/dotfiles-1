#!/usr/bin/osascript

on run
  try
    tell application "Finder"
      copy selection to dirOrFile
      -- do shell script "echo " & dirOrFile
      -- if dirOrFile is not equal to {} then
      try
        my openInApplication(dirOrFile as alias)
      on error
        display dialog "Please choose the parent directory to open multiple files." ¬
         with icon 1 ¬
          buttons {"OK"} ¬
          default button 1
          return
      end try
      -- end if
    end tell
  end try
end run

on openInApplication(dOrF)
  tell application "iA Writer"
    activate
    open (dOrF)
  end tell
end openInApplication