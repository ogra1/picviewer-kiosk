#! /bin/sh

inotifywait -m $SNAP_DATA -e create -e moved_to |
    while read dir action file; do
        echo "The file '$file' appeared in directory '$dir' via '$action'"
        snapctl restart "$SNAP_NAME".imv
done
