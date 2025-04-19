#!/bin/bash

# Make the script executable using: chmod +x git.sh

# Ask for GitHub username
echo "What is your GitHub username? "
read USERNAME

# Ask for GitHub repo name
echo "What is your repository name? "
read REPO_NAME

# Construct the GitHub repo URL
export ORIGIN_URL="https://github.com/${USERNAME}/${REPO_NAME}.git"

# Define the main function
push_project() {
    echo "📁 Checking Git repository status..."

    # Check if Git repo is already initialized
    if [ -d ".git" ]; then
        echo "✅ Git is already initialized in this directory."
    else
        echo "🔧 Initializing a new Git repository..."
        git init
    fi

    # Check if remote 'origin' already exists
    if git remote get-url origin &> /dev/null; then
        echo "✅ Remote 'origin' already exists: $(git remote get-url origin)"
    else
        echo "🔗 Adding remote origin: $ORIGIN_URL"
        git remote add origin ${ORIGIN_URL}
    fi

    # Get the current branch name
    CURRENT_BRANCH=$(git branch --show-current)
    echo "📍 You are currently on branch: '${CURRENT_BRANCH}'"

    # Ask user which branch they want to push to
    echo "On which branch do you want to push the project? "
    read BRANCH_NAME

    # Branch switching logic with extra check for default 'master' → 'main'
    if [ "$CURRENT_BRANCH" != "$BRANCH_NAME" ]; then
        echo "🔍 Checking if we need to switch or rename the branch..."

        if [ "$CURRENT_BRANCH" == "master" ] && [ "$BRANCH_NAME" == "main" ]; then
            echo "🔁 Renaming 'master' to 'main' as per your input..."
            git branch -m master main
        else
            echo "🔀 Switching to branch '${BRANCH_NAME}'..."
            git checkout -b "$BRANCH_NAME"
        fi
    fi

    # Ask which file(s) to add
    echo "📦 Which file do you want to add? (type '.' to add all files)"
    read FILE

    # Add based on user input
    if [ "$FILE" == "." ]; then
        git add .
    else
        git add "$FILE"
    fi

    # Ask user for commit message
    echo "📝 Enter commit message: "
    read COMMIT_MSG

    # Commit the changes
    git commit -m "${COMMIT_MSG}"

    # Push to origin and set upstream branch
    git push origin ${BRANCH_NAME}

    # Show final status
    echo "✅ Push complete. Final status:"
    git status
}

# Call the function to start the process
push_project
echo "🎉 All done!"