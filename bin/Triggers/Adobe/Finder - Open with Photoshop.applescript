#!/usr/bin/osascript

set theApplication to "Applications:Adobe Photoshop CC 2015:Adobe Photoshop CC 2015.app" as alias
tell application "Finder"
  set theFile to selection
	open theFile using theApplication
end tell
