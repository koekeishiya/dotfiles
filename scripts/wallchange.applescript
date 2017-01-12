tell application "System Events"
    tell current desktop
        set initInterval to get change interval
        set change interval to -1
        set change interval to initInterval
     end tell
end tell
