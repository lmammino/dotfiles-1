tell application "Finder"
  try
    set t to target of Finder window 1
    set thePath to (quoted form of POSIX path of (t as alias))
    --display dialog thePath
    set result to do shell script "cd " & thePath & "; ~/bin/gito"
    if result is equal to "" then
      display dialog "The selected directory does not appear to be a Github or Bitbucket repository."
    end if
  on error
    display dialog "Please choose a directory containing a git repository."
  end try
end tell
