#!/usr/bin/env bash

set -u

readonly curpath=$(cd $(dirname $0); pwd)

readonly ignore_file=$curpath/setup.ignore
readonly lock_file=$curpath/setup.lock

ignores=`cat ${ignore_file}`
locks=
if [ -f $lock_file ]; then
    locks=`cat ${lock_file}`
fi

function is_ignore {
    local needle=$1

    if [ -z "${ignores}" ]; then
        return 1
    fi

    for i in $ignores; do
        if [ $i = $needle ]; then
            return 0
        fi
    done

    return 1
}

function is_locked {
    local needle=$1

    if [ -z "${locks}" ]; then
        return 1
    fi

    for i in $locks; do
        if [ $i = $needle ]; then
            return 0
        fi
    done

    return 1
}

_git=`which git 2> /dev/null`; _vim=`which vim 2> /dev/null`; _wget=`which wget 2> /dev/null`; _make=`which make 2> /dev/null`
if [ -z "${_git}" ] || [ -z "${_vim}" ] || [ -z "${_wget}" ] || [ -z "${_make}" ] ; then
    echo You must install git, vim, wget, make. >&2
    exit 1
fi

target_files=`find . -maxdepth 1 -name '\.*' | grep -vE '^$' | grep -vE '^\.+$' | sed -e 's/^\.*\/\(.*\)/\1/g'`

function inspect {
    echo "current path: ${curpath}"

    echo "ignore files:"
    echo $ignores | tr ' ' '\n' | sed 's/^/  /'

    echo "lock files:"
    echo $locks | tr ' ' '\n' | sed 's/^/  /'

    echo "target files:"
    echo $target_files | tr ' ' '\n' | sed 's/^/  /'
}

inspect

read -p "Do you install this settings?[y/n]" yn

case $yn in
    [Yy]* )
    ;;
    * ) echo "Stop to install"; exit 0 ;;
esac

echo "O.K. Transfer process to install"

for file in $target_files; do
    filepath=$curpath/$file

    if [ -d $filepath ]; then
        echo "Skip, that's why ${filepath} is directory"
        continue
    fi
    if is_ignore $file; then
        echo "Skip, that's why ${filepath} is ignored"
        continue
    fi
    if is_locked $file; then
        echo "Skip, that's why ${filepath} is locked"
        continue
    fi

    echo "cat ${filepath} >> ~/${file}"
    cat $filepath >> ~/$file

    echo "${file}" >> $lock_file
done

# vim settings
git clone git@github.com:Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim/
vim -c 'NeoBundleInstall' -c q!
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
mkdir -p ~/.cache/dein && sh ./installer.sh ~/.cache/dein && rm installer.sh
vim -c 'call dein#install()' -c q!
vim -c 'CocInstall coc-json' -c q!

echo "ln -s ${curpath}/.vim/ftdetect to ~/.vim/ftdetect"
ln -s $curpath/.vim/ftdetect ~/.vim/ftdetect
echo "ln -s ${curpath}/.vim/ftplugin to ~/.vim/ftplugin"
ln -s $curpath/.vim/ftplugin ~/.vim/ftplugin
echo "ln -s ${curpath}/.vim/autoload to ~/.vim/autoload"
ln -s $curpath/.vim/autoload ~/.vim/autoload
echo "ln -s ${curpath}/.vim/userautoload to ~/.vim/userautoload"
ln -s $curpath/.vim/userautoload ~/.vim/userautoload

# emacs settings
if ! [ -d ~/emacs.d ]; then
    mkdir ~/.emacs.d
fi
ln -s $curpath/.emacs.d/init.el ~/.emacs.d/init.el

# git settings
wget -O ~/.git-completion.bash --no-check-certificate https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
wget -O ~/.git-prompt.sh --no-check-certificate https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

# zsh settings
git clone git@github.com:zsh-users/zsh-completions.git ~/.zsh-completions/

source ~/.bashrc
