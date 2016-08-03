#!/usr/bin/env osascript

if application "iTerm2" is running then
    tell application "iTerm2"
        create window with default profile
    end tell
else
    activate application "iTerm2"
end if
