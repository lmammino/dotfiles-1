#!/usr/bin/osascript

set theApplication to "Applications:Sketch.app" as alias
tell application "Finder"
  set theFile to selection
	open theFile using theApplication
end tell
