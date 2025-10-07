#!/bin/bash

# Simple passthrough script to team/git.sh
# Usage: ./git.sh [any arguments]

# Ensure we're in the webroot directory
cd "$(dirname "$0")"

# Check if team/git.sh exists
if [ ! -f "team/git.sh" ]; then
    echo "⚠️ ERROR: team/git.sh not found"
    echo "Make sure you're in the webroot directory and the team submodule is initialized"
    exit 1
fi

# Change to team directory and run git.sh from there
cd team
exec ./git.sh "$@"