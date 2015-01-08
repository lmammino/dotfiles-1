#!/usr/bin/osascript

-- make sure shell script is in PATH

tell application "Terminal"
	do script "nginx-start"
	activate
end tell