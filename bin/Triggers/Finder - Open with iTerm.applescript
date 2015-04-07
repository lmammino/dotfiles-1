#!/usr/bin/osascript


tell application "Finder"
  try
    set t to target of Finder window 1
  on error -- there is no window, use desktop instead
    set t to desktop
  end try
  -- there is no 'is subclass of... :-(
  -- you might to to add the 'package' class to the list
  if class of t is not in {folder, disk, class of desktop, class of trash} then set t to container of t
  set thePath to (quoted form of POSIX path of (t as alias))
end tell

tell application "iTerm"
  set term to (make new terminal)
  tell term
    activate
    set term to (launch session "New Session")
    tell term
      write text "cd " & thePath & "; ls -al; pwd"
    end tell

  end tell
  activate
end tell
