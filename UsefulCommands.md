### BONUS :
## Useful Commands 
🔰 Basic Git Setup
Command	Description
"git config --global user.name ""Your Name"""	Sets your Git username.
"git config --global user.email ""you@example.com"""	Sets your Git email.
git config --list	Shows all Git configurations.


## 🗂️ Repository Commands
Command	Description
git init	Initializes a new Git repository.
git clone <repo-url>	Clones an existing repository from a remote server (like GitHub).
git remote -v	Shows remote repository URLs.


## 📥 Staging & Saving Changes
Command	Description
git status	"Shows the status of changes (modified, staged, untracked)."
git add <file>	Stages a specific file.
git add .	Stages all changed files.
"git commit -m ""message"""	Saves staged changes with a message.
"git commit -am ""message"""	Adds and commits tracked files in one step.


## 🔄 Branching & Merging
Command	Description
git branch	Lists all local branches.
git branch <branch-name>	Creates a new branch.
git checkout <branch-name>	Switches to another branch.
git checkout -b <branch-name>	Creates and switches to a new branch.
git merge <branch-name>	Merges another branch into the current one.
git branch -d <branch-name>	Deletes a branch.


## ⬆️⬇️ Working with Remote Repositories
Command	Description
git pull	Fetches and merges changes from the remote repo.
git push	Pushes your changes to the remote repo.
git push -u origin <branch-name>	Pushes a branch to remote and sets upstream tracking.


## 📜 History & Logs
Command	Description
git log	Shows commit history.
git log --oneline	Shows commit history in one line per commit.
git diff	Shows differences between working directory and last commit.
git show <commit-id>	Shows detailed info about a specific commit.


## ♻️ Undoing Changes
Command	Description
git restore <file>	Discards changes in the working directory.
git reset <file>	Unstages a file.
git reset --hard	"Resets to last commit, discards all changes."
git revert <commit-id>	Creates a new commit that undoes the changes of a previous commit.


## 🔍 Extra Handy Commands
Command	Description
git stash	Temporarily saves uncommitted changes.
git stash pop	Restores the most recent stashed changes.
git tag	Lists tags (used for releases).
git tag <tag-name>	Creates a new tag.



      
