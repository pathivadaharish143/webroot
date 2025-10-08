#!/bin/bash

# Simple passthrough script to team/git.sh
# Usage: ./git.sh [any arguments]

# Run here (in webroot) regardless of where called from
cd "$(dirname "$0")"

# Check if team/git.sh exists
if [ ! -f "team/git.sh" ]; then
    echo "⚠️ ERROR: team/git.sh not found"
    echo "Make sure you're in the webroot directory and the team submodule is initialized"
    exit 1
fi

# Run team/git.sh from webroot directory (don't cd into team)
exec ./team/git.sh "$@"