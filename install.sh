mkdir -p ~/.config
[[ -d ~/.vim/bundle/vundle ]] || git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -sf ~/.configs/.vimrc ~
ln -sf ~/.configs/.gitconfig ~
ln -sf ~/.configs/.bash_profile ~
ln -sf ~/.configs/.elinks ~
ln -sf ~/.configs/flake8 ~/.config/
ln -sf ~/.configs/.emacs ~
ln -sf ~/.configs/.xinitrc ~
