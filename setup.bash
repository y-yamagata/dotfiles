#!/usr/bin/env bash

GIT=`which git 2> /dev/null`
VIM=`which vim 2> /dev/null`
WGET=`which wget 2> /dev/null`

if test "-$GIT-" = "--" || test "-$VIM-" = "--" || test "-$WGET-" = "--"
then
    echo You must install git, vim, wget.
    exit 1
fi

current_path=`dirname $0`

ignore_files=`cat $current_path/setup.ignore`
target_files=`ls -1a | grep -vE "^\.+$"`

for file in $target_files
do
    is_ignore=1
    target=$current_path/$file

    if test -d $target
    then
        echo $target is directory.
        is_ignore=0
    fi

    for ignore_file in $ignore_files
    do
        if test $file = $ignore_file
        then
            echo ignore $file
            is_ignore=0
            break
        fi
    done

    if test $is_ignore -eq 0
    then
        continue
    fi

    echo synbolic link: $target to ~/$file
    ln -s $target ~/$file
done

exit 0

git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim/
vim -c "NeoBundleInstall" -c q!

echo make synbolic link: $current_path/.vim/userautoload to ~/.vim/userautoload
ln -s $current_path/.vim/userautoload ~/.vim/userautoload

wget -O ~/.git-completion.bash --no-check-certificate https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
wget -O ~/.git-prompt.sh --no-check-certificate https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

cat .bashrc >> ~/.bashrc

git submodule init
git submodule update

