#!/usr/bin/env bash

set -eu

readonly curpath=$(cd $(dirname $0); pwd)

readonly ignore_file=$curpath/setup.ignore
readonly lock_file=$curpath/setup.lock

ignores=`cat ${ignore_file}`
if -f $lock_file; then
    locks=`cat ${}`
fi

function in_array {
    local needle=$1
    local hystack=$2

    if [ -z "${hystack}" ]; then
        return 1
    fi

    for i in $hystack; do
        if [ $i = $needle ]; then
            return 0
        fi
    done

    return 1
}

function is_ignore {
    is_array $1 $ignores
}

function is_locked {
    is_array $1 $locks
}

_git=`which git 2> /dev/null`; _vim=`which vim 2> /dev/null`; _wget=`which wget 2> /dev/null`; _make=`which make 2> /dev/null`
if [ -z "${_git}" ] || [ -z "${_vim}" ] || [ -z "${_wget}" ] || [ -z "${_make}" ] ; then
    echo You must install git, vim, wget, make. >&2
    exit 1
fi

target_files=`find . -maxdepth 1 -name '\.*' | grep -vE '^$' | grep -vE '^\.+$' | sed -e 's/^\.*\/\(.*\)/\1/g'`
for file in $target_files; do
    filepath=$curpath/$file

    if [ -d $filepath ]; then
        echo "${filepath} is directory."
        continue
    fi
    if is_ignore $file; then
        echo "${filepath} is ignored."
        continue
    fi
    if is_lock $file; then
        echo "${filepath} is locked."
        continue
    fi

    echo "cat ${filepath} >> ~/${file}"
    cat $filepath >> ~/$file

    echo "${filepath}" >> $curpath/setup.lock
done

# vim settings
git clone git@github.com:Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim/
vim -c 'NeoBundleInstall' -c q!

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
