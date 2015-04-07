#!/usr/bin/osascript

-- make sure shell script is in PATH

tell application "Terminal"
	do script "nginx-reload"
	activate
end tell