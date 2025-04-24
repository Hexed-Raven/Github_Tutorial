## GIT & GITHUB :

### What is Git and Github :
Git is version control which allows us to track the changes made in our project step by step
Github is a platform which allows us to use the git and its services 
remote Repo   
                       
### Uploading a project on github 😀
Steps to follow 😀
#### 1.Create a repository on Github                   
 Watch guide at 👇
### Video Demonstration

<video width="600" controls>
    <source src="creatingARepo.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

#### 2.In Local System :
##### 1.Run the git.sh script 
Copy code from git.sh
paste in notepad file
save it as script_name.sh
Run it 

2. set path to your project directory
3. add changes
4. save with commit message
5. push changes to remote repository on desired branch
#### Done 🎉🎊

## Another Way (Without Script)
1. Initialize the git repository in project on your local system  : 
 #### git init 
2. Attach a remote repository to your project : 
 #### git remote add origin repo_url
3. By default you will be on master branch making master as main : 
#### git branch -m master main
4. add your changes to remote repository : 
#### git add .  
add all changes  
#### git add “filename.ext”
add only specific file (Like storing a snapshot of your changes )
5. Save your added changes with a message : 
#### git commit -m “message”
##### NOTE :: Message should be meaningful it must describe which changes were added 
6. push your changes on remote repository on main branch  git push -u origin main git push origin main

Command	What it does
git push origin main	Pushes code to origin/main.
git push -u origin main	"Pushes code + sets tracking, so future push/pull works without branch name."


Common Errors and Solution ::
1. Authentication Error
Error Message: fatal: Authentication failed for 'https://github.com/user/repo.git'
Cause: Incorrect username/password or outdated authentication method.
Solution:
Ensure you are using a Personal Access Token (PAT) instead of a password.
Update your credentials in the credential manager.

2. Permission Denied (Publickey)
Error Message: Permission denied (publickey)
Cause: Missing or incorrectly configured SSH key.
Solution:
Generate an SSH key using ssh-keygen.
Add the public key to your GitHub account under Settings > SSH and GPG Keys.
Use the SSH URL (git@github.com:user/repo.git) instead of HTTPS.

3. Repository Not Found
Error Message: fatal: repository 'https://github.com/user/repo.git' not found
Cause: Incorrect repository URL or lack of access to the repository.
Solution:
Verify the repository URL using git remote -v.
Ensure you have the correct permissions for the repository.

4. Branch Not Up-to-Date
Error Message: error: failed to push some refs to 'https://github.com/user/repo.git'
Cause: Your branch is behind the remote branch.
Solution:
Pull the latest changes: git pull origin branch_name --rebase.
Resolve any merge conflicts, then push.

5. Conflict During Push
Error Message: error: Your local changes to the following files would be overwritten by merge
Cause: There are uncommitted changes locally that conflict with the remote.
Solution:
Stash local changes, then pull and reapply the stash:

git stash
git pull
git stash apply
Resolve conflicts and commit.
8. Untracked Files Preventing Checkout
Error Message: error: Untracked working tree file 'filename' would be overwritten by merge
Cause: Untracked files in the local repository conflict with files in the remote branch.
Solution:
Add or remove untracked files as appropriate:
git add filename
git commit -m "Add untracked file"

10. Push Rejected Due to Non-Fast-Forward Updates
Error Message: Updates were rejected because the tip of your current branch is behind its remote counterpart
Cause: Your branch is behind the remote branch.
Solution:
Perform a rebase:
git pull --rebase origin branch_name
Push the changes after resolving conflicts.


