#!/bin/bash

# Make this script executable using: chmod +x git.sh

# Getting user input
echo "What is your GitHub username? "
read USERNAME

echo "What is your repository name? "
read REPO_NAME

# Construct repo URL
export ORIGIN_URL="https://github.com/${USERNAME}/${REPO_NAME}.git"

# Define the function to push the project
push_project() {
    echo "📁 Checking Git repository status..."

    # Check if .git is already initialized
    if [ -d ".git" ]; then
        echo "✅ Git is already initialized in this directory."
    else
        echo "🔧 Initializing a new Git repository..."
        git init
    fi

    # Check if 'origin' remote already exists
    if git remote get-url origin &> /dev/null; then
        echo "✅ Remote 'origin' already exists: $(git remote get-url origin)"
    else
        echo "🔗 Adding remote origin: $ORIGIN_URL"
        git remote add origin ${ORIGIN_URL}
    fi

    # Current branch
    CURRENT_BRANCH=$(git branch --show-current)
    echo "📍 You are currently on branch: '${CURRENT_BRANCH}'"

    echo "On which branch do you want to push the project? "
    read BRANCH_NAME

    # Switch/create branch if needed
    if [ "$CURRENT_BRANCH" != "$BRANCH_NAME" ]; then
        echo "🔀 Switching to branch '${BRANCH_NAME}'..."
        git checkout -b "$BRANCH_NAME"
    fi

    git add .

    echo "📝 Enter commit message: "
    read COMMIT_MSG

    git commit -m "${COMMIT_MSG}"
    git push -u origin ${BRANCH_NAME}

    echo "✅ Push complete. Final status:"
    git status
}

# Call the function
push_project
