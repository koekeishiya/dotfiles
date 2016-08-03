kwmc=/usr/local/bin/kwmc
dir=$1
if [ "$dir" = "previous" ]
then
    dir=$(kwmc query space previous)
    $kwmc window -m space previous
else
    $kwmc window -m space $dir
fi
sleep 0.25
$kwmc space -fExperimental $dir
killall Dock
