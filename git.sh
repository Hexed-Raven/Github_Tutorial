#!/bin/bash

# Make the script executable using: chmod +x git.sh

# Move to project folder
echo "What is the path of your project? (use '.' for the current folder)"
read PROJECT_PATH

if [ "$PROJECT_PATH" != "." ]; then
    # Moving to project folder if not the current folder
    cd "$PROJECT_PATH" || { echo "Invalid path! Exiting."; exit 1; }
    echo -e "Moving to $PROJECT_PATH \n\n"
fi

# Ask for GitHub username
echo -e "\n\nWhat is your GitHub username?"
read USERNAME

# Ask for GitHub repo name
echo -e "\n\nWhat is your repository name?"
read REPO_NAME

# Construct the GitHub repo URL
ORIGIN_URL="https://github.com/${USERNAME}/${REPO_NAME}.git"

# Define the main function
push_project() {
    echo -e "\n\n📁 Checking Git repository status..."

    # Check if Git repo is already initialized
    if [ -d ".git" ]; then
        echo -e "\n✅ Git is already initialized in this directory."
    else
        echo -e "\n🔧 Initializing a new Git repository..."
        git init || { echo "Failed to initialize Git. Exiting."; exit 1; }
    fi

    # Check if remote 'origin' already exists
    if git remote get-url origin &>/dev/null; then
        echo -e "\n\n✅ Remote 'origin' already exists: $(git remote get-url origin)"
    else
        echo -e "\n\n🔗 Adding remote origin: $ORIGIN_URL"
        git remote add origin "$ORIGIN_URL" || { echo "Failed to add remote. Exiting."; exit 1; }
    fi

    # Get the current branch name
    CURRENT_BRANCH=$(git branch --show-current)
    echo -e "\n\n📍 You are currently on branch: '${CURRENT_BRANCH}'"

    # Status of your branch
    echo -e "\n\n📝 Checking the status of your branch..."
    git status

    # Ask user which branch they want to push to
    echo -e "\nOn which branch do you want to push the project?"
    read BRANCH_NAME

    # Branch switching logic
    if [ "$CURRENT_BRANCH" != "$BRANCH_NAME" ]; then
        echo -e "\n🔀 Switching to branch '${BRANCH_NAME}'..."
        git checkout "$BRANCH_NAME" 2>/dev/null || git checkout -b "$BRANCH_NAME" || { echo "Failed to switch branches. Exiting."; exit 1; }
    fi

    # Ask which file(s) to add
    echo -e "\n📦 Which file(s) do you want to add? (type '.' to add all files)"
    read FILE

    # Add files based on user input
    if [ "$FILE" == "." ]; then
        git add . || { echo "Failed to add files. Exiting."; exit 1; }
    else
        git add "$FILE" || { echo "Failed to add specified file. Exiting."; exit 1; }
    fi

    # Ask user for commit message
    echo -e "\n📝 Enter commit message:"
    read COMMIT_MSG

    # Commit the changes
    git commit -m "${COMMIT_MSG}" || { echo "Commit failed. Exiting."; exit 1; }

    # Push to origin and set upstream branch
    git push -u origin "${BRANCH_NAME}" || { echo "Push failed. Exiting."; exit 1; }

    # Show final status
    echo -e "\n✅ Push complete. Final status:"
    git status
}

# Call the function to start the process
push_project
echo -e "\n\n🎉 All done!"
