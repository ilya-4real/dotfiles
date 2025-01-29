#!/bin/sh

expenv() {
    local filepath="$1"

    if [[ ! -f "$filepath" ]]; then
        echo "File not found: $filepath"
        return 1
    fi

    while IFS= read -r line; do
        # Skip empty lines and comments (lines starting with #)
        if [[ -z "$line" || "$line" =~ ^# ]]; then
            continue
        fi

        # Split the line into key and value
        key=$(echo "$line" | cut -d= -f1)
        value=$(echo "$line" | cut -d= -f2-)

        # Remove any leading/trailing whitespace
        key=$(echo "$key" | xargs)
        value=$(echo "$value" | xargs)

        # Export the key-value pair as an environment variable
        export "$key"="$value"
    done < "$filepath"

    echo "Environment variables loaded from $filepath"
}

remenv() {
    local filepath="$1"

    if [[ ! -f "$filepath" ]]; then
        echo "File not found: $filepath"
        return 1
    fi

    while IFS= read -r line; do
        # Skip empty lines and comments (lines starting with #)
        if [[ -z "$line" || "$line" =~ ^# ]]; then
            continue
        fi

        # Extract the key (variable name) from the line
        key=$(echo "$line" | cut -d= -f1 | xargs)

        # Unset the variable from the environment
        if [[ -n "$key" ]]; then
            unset "$key"
            echo "Unset environment variable: $key"
        fi
    done < "$filepath"

    echo "Environment variables unset from $filepath"
}
