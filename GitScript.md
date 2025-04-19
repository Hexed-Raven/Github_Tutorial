## git.sh 


#!/bin/bash
#### This tells the system to use Bash to run this script

#### --- GET USER INPUT ---

#### Ask the user for their GitHub username
echo "What is your GitHub username? "
read USERNAME  # Stores input in the variable USERNAME

#### Ask for the repository name
echo "What is your repository name? "
read REPO_NAME  # Stores input in the variable REPO_NAME

#### Create the GitHub repository URL
export ORIGIN_URL="https://github.com/${USERNAME}/${REPO_NAME}.git"
#### Example: https://github.com/mehndi/my-repo.git

#### --- FUNCTION TO PUSH THE PROJECT ---

push_project() {
    echo "📁 Checking Git repository status..."

    # --- CHECK IF GIT IS INITIALIZED ---
    if [ -d ".git" ]; then
        # If the .git folder exists, Git is already initialized
        echo "✅ Git is already initialized in this directory."
    else
        # If not, initialize a new Git repo
        echo "🔧 Initializing a new Git repository..."
        git init
    fi

    # --- CHECK IF REMOTE ORIGIN EXISTS ---
    if git remote get-url origin &> /dev/null; then
        # If the remote named "origin" already exists, display its URL
        echo "✅ Remote 'origin' already exists: $(git remote get-url origin)"
    else
        # Otherwise, add the new origin remote using the constructed URL
        echo "🔗 Adding remote origin: $ORIGIN_URL"
        git remote add origin ${ORIGIN_URL}
    fi

    # --- CHECK CURRENT BRANCH ---
    CURRENT_BRANCH=$(git branch --show-current)  # Store the current branch name
    echo "📍 You are currently on branch: '${CURRENT_BRANCH}'"

    # Ask user which branch they want to push to
    echo "On which branch do you want to push the project? "
    read BRANCH_NAME

    # --- SWITCH TO DESIRED BRANCH IF NEEDED ---
    if [ "$CURRENT_BRANCH" != "$BRANCH_NAME" ]; then
        # If current branch is different from the one they want, switch
        echo "🔀 Switching to branch '${BRANCH_NAME}'..."
        git checkout -b "$BRANCH_NAME"  # Create and switch to the new branch
    fi

    # --- ADD & COMMIT CHANGES ---
    git add .  # Stage all changes in the project

    # Ask for a commit message
    echo "📝 Enter commit message: "
    read COMMIT_MSG  # Save input in COMMIT_MSG variable

    # Commit the staged files with the provided message
    git commit -m "${COMMIT_MSG}"

    # --- PUSH TO GITHUB ---
    git push -u origin ${BRANCH_NAME}  # Push and set upstream tracking

    # --- FINAL STATUS ---
    echo "✅ Push complete. Final status:"
    git status  # Show the current state of the working directory
}

#### --- CALL THE FUNCTION ---
push_project  # Execute the function

# Output :
# What is your GitHub username? 
# Hexed-Raven
# What is your repository name? 
# my-repo
# 📁 Checking Git repository status...
# ✅ Git is already initialized in this directory.
# ✅ Remote 'origin' already exists: https://github.com/mehndi/my-repo.git
# 📍 You are currently on branch: 'main'
# On which branch do you want to push the project? 
# main
# 🔀 Switching to branch 'main'...
# 📝 Enter commit message: 
# Initial commit
