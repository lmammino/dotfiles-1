#!/usr/bin/osascript

try
  do shell script "defaults read com.apple.finder AppleShowAllFiles"
on error
  do shell script "defaults write com.apple.finder AppleShowAllFiles 1"
end try

set dotVisible to do shell script "defaults read com.apple.Finder AppleShowAllFiles"
if dotVisible = "0" then
  do shell script "defaults write com.apple.finder AppleShowAllFiles 1"
else
  do shell script "defaults write com.apple.finder AppleShowAllFiles 0"
end if

do shell script "killall Finder"