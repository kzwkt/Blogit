### Git global setup

```
git config --global user.name "LinArcX"
git config --global user.email "linarcx@gmail.com"
```

### Set vim as default editor
```
git config --global core.editor "vim"
or
sudo git config --system core.editor vim
```


### Pull current project on github
```
git branch --set-upstream-to=origin/master master
or 
git pull origin master
```

### Existing folder:
```
cd existing_folder
git init
git remote add origin https://gitlab.com/LinArcX/Tvdoon.git
git add .
git commit -m "Initial commit"
```

before push we have to pull all files first:

* `git branch --set-upstream-to=origin/master`

* `git pull`

if you see:
`fatal: refusing to merge unrelated histories`:

`git pull --allow-unrelated-histories`

then:
```
git push -u origin master
```


### Existing Git repository
```
cd existing_repo
git remote rename origin old-origin
git remote add origin https://gitlab.com/LinArcX/Tvdoon.git
git push -u origin --all
git push -u origin --tags
```

### Create a new repository
```
git clone https://gitlab.com/LinArcX/Tvdoon.git
cd Tvdoon
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
```
### Rename Existing Project
1. Go to the remote host (e.g., https://github.com/User/project).
2. Follow the host's instructions to rename the project (will differ from host to host, but usually Settings is a good starting point).
3. Go to your local repository directory (i.e., open a command prompt and change to the repository's directory).
4. Determine the new URL (e.g., git@github.com:User/project-new.git)
5. Set the new URL using git:
6. `git remote set-url origin git@github.com:User/project-new.git`

### Find remote url
`git remote show origin`


### List Of Remotes
`git remote -v`

### update tag in editor
`git tag <tag name> <tag name> -f -a`

### show remote tags
`git ls-remote --tags`

### current working tag
`git describe --tags`

### Change remote addresses
```
git remote -v
# View existing remotes
# origin  https://github.com/user/repo.git (fetch)
# origin  https://github.com/user/repo.git (push)

git remote set-url origin https://github.com/user/repo2.git
# Change the 'origin' remote's URL

git remote -v
# Verify new remote URL
# origin  https://github.com/user/repo2.git (fetch)
# origin  https://github.com/user/repo2.git (push)
```

