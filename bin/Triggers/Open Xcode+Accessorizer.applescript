#!/usr/bin/osascript

on ApplicationIsRunning(appName)
	tell application "System Events" to set appNameIsRunning to exists (processes where name is appName)
	return appNameIsRunning
end ApplicationIsRunning

if ApplicationIsRunning("Accessorizer")
  do shell script "open /Applications/Xcode.app"
else
  do shell script "open /Applications/Xcode.app"
  do shell script "open /Applications/Accessorizer.app"
end