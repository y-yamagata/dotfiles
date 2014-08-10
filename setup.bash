#!/usr/bin/env bash

GIT=`which git 2> /dev/null`
VIM=`which vim 2> /dev/null`
WGET=`which wget 2> /dev/null`

if test "-$GIT-" = "--" || test "-$VIM-" = "--" || test "-$WGET-" = "--"
then
    echo You must install git, vim, wget.
    exit 1
fi

current_path=$(cd $(dirname $0); pwd)

ignore_files=`cat $current_path/setup.ignore`
target_files=`ls -1a --color=none | grep -vE "^\.+$"`

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

git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim/
vim -c "NeoBundleInstall" -c q!

echo synbolic link: $current_path/.vim/ftplugin to ~/.vim/ftplugin
ln -s $current_path/.vim/ftplugin ~/.vim/ftplugin
echo synbolic link: $current_path/.vim/userautoload to ~/.vim/userautoload
ln -s $current_path/.vim/userautoload ~/.vim/userautoload

wget -O ~/.git-completion.bash --no-check-certificate https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
wget -O ~/.git-prompt.sh --no-check-certificate https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

git clone git://github.com/zsh-users/zsh-completions.git ~/.zsh-completions/

cat .bashrc >> ~/.bashrc
cat .zshrc >> ~/.zshrc

