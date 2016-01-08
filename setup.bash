#!/usr/bin/env bash

set -eu

curpath=$(cd $(dirname $0); pwd)
ignores=`cat $curpath/setup.ignore`

is_ignore() {
    file=$1
    for i in $ignores; do
        if [ $i = $file ]; then
            return 0
        fi
    done
    return 1
}

_git=`which git 2> /dev/null`; _vim=`which vim 2> /dev/null`; _wget=`which wget 2> /dev/null`; _make=`which make 2> /dev/null`
if [ -z "${_git}" ] || [ -z "${_vim}" ] || [ -z "${_wget}" ] || [ -z "${_make}" ] ; then
    echo You must install git, vim, wget, make.
    exit 1
fi

targets=`find . -maxdepth 1 -name '\.*' | grep -vE '^$' | grep -vE '^\.+$' | sed -e 's/^\.*\/\(.*\)/\1/g'`
for f in $targets; do
    target=$curpath/$f

    if [ -d $target ]; then
        echo "${target} is directory."
        continue
    fi
    if is_ignore $f; then
        echo "${target} is ignored."
        continue
    fi

    echo "cat ${target} >> ~/${f}"
    cat $target >> ~/$f
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

