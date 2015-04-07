#!/usr/bin/osascript

set theApplication to "Applications:Byword.app" as alias
tell application "Finder"
  set theFile to selection
	open theFile using theApplication
end tell
