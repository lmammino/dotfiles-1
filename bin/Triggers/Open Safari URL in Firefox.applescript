tell application "Safari" to set currentURL to URL of current tab of window 1
tell application "Firefox"
	activate
	open location currentURL
end tell