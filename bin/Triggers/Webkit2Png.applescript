#!/usr/bin/osascript

tell application "Safari" to set currentURL to URL of current tab of window 1
tell application "Safari" to set windowBounds to bounds of window 1
set windowWidth to third item of windowBounds - first item of windowBounds
do shell script "~/bin/webkit2png -W " & windowWidth & " -z 2.0 --delay=1 -F -D ~/Desktop " & currentURL