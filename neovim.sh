_nvim=$(which nvim 2> /dev/null); _node=$(which node 2> /dev/null)
if [ -z "${_nvim}" ] || [ -z "${_node}" ]; then
    echo "You must install vim, node" >&2
else
    if [ ! -d ~/.config/nvim ]; then
        mkdir -p ~/.config/nvim
    fi

    cp -i ${curpath}/.config/nvim/init.vim ~/.config/nvim
    cp -i ${curpath}/.config/nvim/dein.toml ~/.config/nvim
    cp -i ${curpath}/.config/nvim/dein_lazy.toml ~/.config/nvim
    cp -i ${curpath}/.config/nvim/coc-settings.json ~/.config/nvim

    if [ ! -d ~/.cache/dein ]; then
        curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
        mkdir -p ~/.cache/dein && sh /tmp/installer.sh ~/.cache/dein && rm /tmp/installer.sh
        $_nvim -c 'call dein#install()' -c q!
        $_nvim -c 'CocInstall coc-json' -c q!
    fi

    if [ ! -d ~/.config/nvim/autoload ]; then
        mkdir ~/.config/nvim/autoload
    fi
    cp -i ${curpath}/.config/nvim/autoload/* ~/.config/nvim/autoload
    if [ ! -d ~/.config/nvim/userautoload ]; then
        mkdir ~/.config/nvim/userautoload
    fi
    cp -i ${curpath}/.config/nvim/userautoload/* ~/.config/nvim/userautoload
fi
