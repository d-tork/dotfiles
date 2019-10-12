# dotfiles

## Installing on new system

Prior to the installation make sure you have committed the alias to your `.bashrc` or `.bash_profile`

```
$ which git  # find out where your git is located
/usr/local/bin/git 
$ alias config='/usr/local/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Now clone your dotfiles into a bare repository in a `.cfg` folder

```
$ git clone --bare git@github.com:d-tork/dotfiles.git $HOME/.cfg
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
