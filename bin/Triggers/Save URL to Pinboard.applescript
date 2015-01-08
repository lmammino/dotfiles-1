#!/usr/bin/osascript

set _username to "dylansm"
set _password to "2574azp"

tell application "LaunchBar" to hide
tell application "Safari" to set _currentURL to URL of current tab of window 1

if _currentURL is not "" then
   set _rtnValue to do shell script "curl -s --user " & _username & ":" & _password & " --data-urlencode url=" & (quoted form of _currentURL) & " https://api.pinboard.in/v1/posts/add"
   
   display dialog _rtnValue
end if