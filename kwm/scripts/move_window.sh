kwmc=/usr/local/bin/kwmc
DIR=$1
FOCUSED_WINDOW=$($kwmc query window focused id)
NEW_WINDOW=$($kwmc query window focused "$DIR")
SAME_PARENT=$($kwmc query window parent "$FOCUSED_WINDOW" "$NEW_WINDOW")
if [ "$SAME_PARENT" = "true" ]
then
    $kwmc window -s "$DIR"
else
    SPAWN=$($kwmc query tiling spawn)
    CHILD=$($kwmc query window child "$NEW_WINDOW")
    if [ "$CHILD" = "left" ]
    then
        $kwmc config spawn right
    else
        $kwmc config spawn left
    fi

    $kwmc window -m "$DIR"
    $kwmc config spawn "$SPAWN"
fi
