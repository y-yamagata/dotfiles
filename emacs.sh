if [ ! -d ~/.emacs.d ]; then
    mkdir ~/.emacs.d
fi
cp -i $curpath/.emacs.d/init.el ~/.emacs.d/init.el
