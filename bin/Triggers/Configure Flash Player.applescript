#!/usr/bin/osascript

tell application "Terminal"
	-- need two backslashes to escape space
	set cfp to "~/bin/cfp"
	do script cfp
	activate
end tell