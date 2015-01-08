#!/usr/bin/osascript

tell application "Finder"
  try
    set t to target of Finder window 1
  on error
    set t to desktop
  end try

  if class of t is in {folder, disk, class of desktop, class of trash} then
    try
      set theFile to (get selection as alias)
    on error
      display dialog "Please choose the parent directory to open multiple files." ¬
       with icon 1 ¬
        buttons {"OK"} ¬
        default button 1
        return
    end try
    if (t as alias) is not equal to theFile
      set theParentPath to (quoted form of POSIX path of (t as alias))
    else
      set thePath to (quoted form of POSIX path of (t as alias))
    end if
    set theFile to (quoted form of POSIX path of theFile)
  end if
end tell

tell application "Terminal"
  try
    do script "cd " & theParentPath & "; vim '" & theFile & "'"
  on error
    do script "cd " & thePath & "; vim ."
  end try
  activate
end tell
