mv ~/.emacs.d ~/.emacs.d.$(date +%F)
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/.gitignore" ~
ln -sfv "$DOTFILES_DIR/.mbsyncrc" ~
ln -sfv "$DOTFILES_DIR/.emacs.d" ~
ln -sfv "$DOTFILES_DIR/certs" ~
