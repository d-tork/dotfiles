# dotfiles
Based on https://www.atlassian.com/git/tutorials/dotfiles

## Installing on new system

Prior to the installation make sure you have committed the alias to your `.*rc` or `.bash_profile`

```
$ which git  # find out where your git is located
/usr/bin/git 
$ alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Now clone your dotfiles into a bare repository in a `.cfg` folder

```
$ git clone --bare https://github.com/d-tork/dotfiles.git $HOME/.cfg
```

Checkout the actual content from the bare repository

```
config checkout
```

* If you have existing dotfiles already, this will fail until you remove them. 


Set the flag showUntrackedFiles to no on this specific (local) repository

```
$ config config --local status.showUntrackedFiles no
```

## Usage

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

### Notes to self
* Each computer has its own branch; constantly rebase on top of master
	- to fast-forward master branch without checking out:
	```bash
	config fetch origin master:master
	```
* The master branch controls _very simple baseline configurations_; leave the
specifics of .zshrc, git username, conda environment, etc. to each branch
* The master branch .gitconfig does not contain the name field; for that, run
the `.autogitconfig.sh` script once on your branch to set the name according
to the login and hostname. 
