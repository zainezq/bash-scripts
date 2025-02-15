 #!/bin/bash

TL_DIR="/home/zaine/master-folder/org_files/todo" # Adjust this as needed
MASTER_TL="/home/zaine/master-folder/org_files/todo/master-tl.org" #Adjust this as needed

# You will need to install 'inotifywait'
inotifywait -m "$TL_DIR" -e create -e moved_to -e modify --format '%w%f' |
while read filepath; do
    # Ignore changes to the master file itself and system-generated files
    if [[ "$filepath" == "$MASTER_TL" || "$filepath" =~ ^.*\/\.goutputstream-.*$ || "$filepath" =~ ^.*\/\..* ]]; then
        continue
    fi

    filename=$(basename "$filepath")

    echo "Processing $filepath..."
    
    # Ensure it's a valid, non-empty file
    if [[ -f "$filepath" && -s "$filepath" ]]; then
        # Temporarily store new content
        TMP_FILE=$(mktemp)
        {
            echo "* START $filename *"
            cat "$filepath"
            echo "* END $filename *"
        } > "$TMP_FILE"

        # Remove old content related to this file safely
        sed -i "/* START $filename */,/* END $filename */d" "$MASTER_TL"

        # Append new content
        cat "$TMP_FILE" >> "$MASTER_TL"
        rm "$TMP_FILE"

        echo "Updated master task list with $filename."
    else
        echo "Skipping empty or unreadable file: $filepath"
    fi
done
