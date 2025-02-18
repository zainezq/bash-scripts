#!/bin/bash

TL_DIR="/home/zaine/master-folder/org_files/todo" #adjust
MASTER_TL="/home/zaine/master-folder/org_files/todo/master-tl.org" #adjust

# Determine the weekly file
WEEKLY_FILE="$TL_DIR/$(date +%Y)-week-$(date +%V).org"

# Ensure weekly file exists
if [[ ! -f "$WEEKLY_FILE" ]]; then
    touch "$WEEKLY_FILE"
    echo "Created new weekly todo file: $WEEKLY_FILE"
fi

# inotify-tools will need to be installed
inotifywait -m "$TL_DIR" -e create -e moved_to -e modify --format '%w%f' |
while read filepath; do
    if [[ "$filepath" == "$MASTER_TL" || "$filepath" =~ ^.*\/\.goutputstream-.*$ || "$filepath" =~ ^.*\/\..* ]]; then
        continue
    fi

    filename=$(basename "$filepath")

    echo "Processing $filepath..."

    # Ensure it's a valid, non-empty file
    if [[ -f "$filepath" && -s "$filepath" ]]; then
        TMP_FILE=$(mktemp)
        {
            echo "* START $filename *"
            cat "$filepath"
            echo "* END $filename *"
        } > "$TMP_FILE"

        # Remove old content for this file in `master-tl.org`
        sed -i "/\* START $filename \*/,/\* END $filename \*/d" "$MASTER_TL"

        # Append new content
        cat "$TMP_FILE" >> "$MASTER_TL"
        rm "$TMP_FILE"

        echo "Updated master task list with $filename."
    else
        echo "Skipping empty or unreadable file: $filepath"
    fi
done
