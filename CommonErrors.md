## 🚨 Common Git Errors & Their Solutions

---

### 1. 🔐 Authentication Error

**Error Message:**  
`fatal: Authentication failed for 'https://github.com/user/repo.git'`

**Cause:**  
Incorrect username/password or outdated authentication method.

**Solution:**
- Use a **Personal Access Token (PAT)** instead of a password.
- Update your credentials using your system's **Credential Manager** or keychain.

---

### 2. 🔑 Permission Denied (Publickey)

**Error Message:**  
`Permission denied (publickey)`

**Cause:**  
Missing or incorrectly configured SSH key.

**Solution:**
- Generate an SSH key:
  ```bash
  ssh-keygen -t ed25519 -C "your_email@example.com"
Add the public key to GitHub under
Settings > SSH and GPG Keys > New SSH Key

Use the SSH clone URL instead of HTTPS:
git@github.com:user/repo.git

3. 🕵️ Repository Not Found
Error Message:
fatal: repository 'https://github.com/user/repo.git' not found

Cause:
Incorrect repository URL or lack of access.

Solution:

Verify the remote URL:

git remote -v
Ensure you have access and that the repository exists.

4. 🔄 Branch Not Up-to-Date
Error Message:
error: failed to push some refs to 'https://github.com/user/repo.git'

Cause:
Your branch is behind the remote branch.

Solution:

Pull the latest changes with rebase:

bash
Copy
Edit
git pull origin branch_name --rebase
Resolve any conflicts, then push:

bash
Copy
Edit
git push origin branch_name
5. ⚔️ Conflict During Push
Error Message:
error: Your local changes to the following files would be overwritten by merge

Cause:
Uncommitted local changes are conflicting with remote.

Solution:

Stash your local changes:

bash
Copy
Edit
git stash
Pull the latest changes:

bash
Copy
Edit
git pull
Reapply your stashed changes:

bash
Copy
Edit
git stash apply
Resolve any conflicts, then commit and push.

6. 📁 Untracked Files Preventing Checkout
Error Message:
error: Untracked working tree file 'filename' would be overwritten by merge

Cause:
You have untracked files that conflict with files in the remote branch.

Solution:

If the files are needed:

bash
Copy
Edit
git add filename
git commit -m "Add untracked file"
If not needed, remove them:

bash
Copy
Edit
git clean -f
7. 🚫 Push Rejected: Non-Fast-Forward Updates
Error Message:
Updates were rejected because the tip of your current branch is behind its remote counterpart

Cause:
Your branch is behind and can't be pushed without syncing.

Solution:

Rebase your branch with the latest remote changes:

bash
Copy
Edit
git pull --rebase origin branch_name
Resolve conflicts and then push:

bash
Copy
Edit
git push origin branch_name
