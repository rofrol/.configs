mkdir -p ~/.config
[[ -d ~/.vim/bundle/vundle ]] || git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -sf ~/.configs/.vimrc ~
ln -sf ~/.configs/.gitconfig ~
ln -sf ~/.configs/.bash_profile ~
[ -d ~/.configs/.elinks ] || ln -sf ~/.configs/.elinks ~
ln -sf ~/.configs/flake8 ~/.config/
ln -sf ~/.configs/.emacs ~
sudo ln -sf ~/.configs/30-msfonts-aliases.conf /usr/share/fontconfig/conf.avail/
ln -sf ~/.configs/.Xresources ~
ln -sf ~/.configs/openbox ~/.config/
ln -sf ~/.configs/.xinitrc.openbox ~
