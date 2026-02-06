#!/bin/bash
# Helper script to sync local changes to GitHub

MESSAGE=${1:-"Update project: $(date +'%Y-%m-%d %H:%M:%S')"}
GH_BIN="/home/dev/san/antigravity_stuff/hello_world/gh_2.40.1_linux_amd64/bin/gh"

echo "Checking for changes..."
if [[ -z $(git status -s) ]]; then
  echo "No changes to sync."
  exit 0
fi

echo "Adding changes..."
git add .

echo "Committing changes: $MESSAGE"
git commit -m "$MESSAGE"

echo "Pushing to GitHub..."
git push origin master

echo "Sync complete!"
