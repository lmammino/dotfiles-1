#!/usr/bin/osascript

on run
	try
		tell application "Finder"
			copy selection to dirOrFile
			-- do shell script "echo " & dirOrFile
			-- if dirOrFile is not equal to {} then
			my openInApplication(dirOrFile as alias)
			-- end if
		end tell
	end try
end run

on openInApplication(dOrF)
	tell application "Marked"
		activate
		open (dOrF)
	end tell
end openInApplication