#!/bin/bash
# connect_remote.sh
# This script adds the GitHub Pages repo as the origin remote if not present,
# then fetches and merges the latest changes from main.

REPO_URL="https://github.com/cementheadxl/cementheadxl.github.io.git"
REMOTE_NAME="origin"
BRANCH="main"

# Check for existing remote
if git remote | grep -q "^${REMOTE_NAME}$"; then
  echo "Remote '${REMOTE_NAME}' already exists."
else
  git remote add ${REMOTE_NAME} ${REPO_URL}
  echo "Added remote '${REMOTE_NAME}' -> ${REPO_URL}"
fi

# Fetch and merge
git fetch ${REMOTE_NAME}
git pull ${REMOTE_NAME} ${BRANCH} --allow-unrelated-histories

echo "Repository is now up to date with ${REMOTE_NAME}/${BRANCH}."
