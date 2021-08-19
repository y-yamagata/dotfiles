_git=$(which git 2> /dev/null); _vim=$(which vim 2> /dev/null); _make=$(which make 2> /dev/null)
if [ -z "${_git}" ] || [ -z "${_vim}" ] || [ -z "${_make}" ]; then
    echo "You must install git, vim, make" >&2
else
    cp -i ${curpath}/.vimrc ~/.vimrc

    if [ ! -d ~/.vim/bundle/neobundle.vim/ ]; then
        $_git clone git@github.com:Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim/
        $_vim -c 'NeoBundleInstall' -c q!
    fi
    if [ ! -d ~/.cache/dein ]; then
        curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
        mkdir -p ~/.cache/dein && sh /tmp/installer.sh ~/.cache/dein && rm /tmp/installer.sh
        $_vim -c 'call dein#install()' -c q!
    fi

    cp -i ${curpath}/.vim/dein.toml ~/.vim
    cp -i ${curpath}/.vim/dein_lazy.toml ~/.vim
    cp -i ${curpath}/.vim/coc-settings.json ~/.vim
    if [ ! -d ~/.vim/ftdetect ]; then
        mkdir ~/.vim/ftdetect
    fi
    cp -i ${curpath}/.vim/ftdetect/* ~/.vim/ftdetect
    if [ ! -d ~/.vim/ftplugin ]; then
        mkdir ~/.vim/ftplugin
    fi
    cp -i ${curpath}/.vim/ftplugin/* ~/.vim/ftplugin
    if [ ! -d ~/.vim/autoload ]; then
        mkdir ~/.vim/autoload
    fi
    cp -i ${curpath}/.vim/autoload/* ~/.vim/autoload
    if [ ! -d ~/.vim/userautoload ]; then
        mkdir ~/.vim/userautoload
    fi
    cp -i ${curpath}/.vim/userautoload/* ~/.vim/userautoload
fi
