#!/usr/bin/osascript

tell application "iTunes"
	set vol to sound volume
	set sound volume to vol - 5
end tell