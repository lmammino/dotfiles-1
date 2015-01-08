#!/usr/bin/osascript

tell application "Finder"
	set _files to selection
	repeat with _file in _files
		do shell script "qlmanage -p -c public.plain-text " & POSIX path of (_file as alias) & " 2> /dev/null &"
	end repeat
end tell