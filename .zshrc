echo "First Time Installation"

mkdir -p ~/projects
mkdir -p ~/.zsh

DOTFILES_REPO="https://github.com/Harjanator/dotfiles.git"
DOTFILES_DIR="~/projects"

git clone ${DOTFILES_REPO} ${DOTFILES_DIR}
cd ${DOTFILES_DIR}

stow .zsh -t ~/.zsh
cp .zsh/gurulanzia.zsh  ~/.zshrc

source ~/.zshrc