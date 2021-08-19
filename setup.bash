#!/usr/bin/env bash

# set -e

. $(dirname $0)/common.sh

_wget=`which wget 2> /dev/null`
if [ -z "${_wget}" ]; then
    echo "You must install wget" >&2
    exit 1
fi

parse-option $@

target_files=$(find . -type f -maxdepth 1 -name '\.*' | grep -vE '^$' | grep -vE '^\.+$' | grep -v '.zshrc' | sed -e 's/^\.*\/\(.*\)/\1/g')

function inspect {
    echo "current path: ${curpath}"
    echo ;

    echo "ignore files:"
    echo $ignores | tr ' ' '\n' | sed 's/^/  /'
    echo ;

    echo "lock files:"
    echo $locks | tr ' ' '\n' | sed 's/^/  /'
    echo ;

    echo "target files:"
    echo $target_files | tr ' ' '\n' | sed 's/^/  /'
    echo ;

    echo "actual target files:"
    for file in $target_files; do
        if ignore? $file; then
            continue
        fi
        if locked? $file; then
            continue
        fi
        echo "  ${file}"
    done
    echo ;
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

    if ignore? $file; then
        echo "Skip, that's why ${filepath} is ignored"
        continue
    fi
    if locked? $file; then
        echo "Skip, that's why ${filepath} is locked"
        continue
    fi

    if [ $file = ".bashrc" ]; then
        echo "cat ${filepath} >> ~/${file}"
        cat $filepath >> ~/$file
    else
        cp -i $filepath ~/$file
    fi

    echo "${file}" >> $lock_file
done

if "$withvim"; then
    . $curpath/vim.sh
fi
if "$withneovim"; then
    . $curpath/neovim.sh
fi
if "$withemacs"; then
    . $curpath/emacs.sh
fi

# git settings
# wget -O ~/.git-completion.bash --no-check-certificate https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
# wget -O ~/.git-prompt.sh --no-check-certificate https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

# source ~/.bashrc
