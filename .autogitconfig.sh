# Executables to configure git (and leave out .gitconfig from dotfile management)

git config --global user.name "$USER@$HOSTNAME"
git config --global user.email "dtorkelson@gmail.com"
git config --global core.autocrlf input
git config --global core.editor vi

# Aliases
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.adog "log --all --decorate --oneline --graph"
