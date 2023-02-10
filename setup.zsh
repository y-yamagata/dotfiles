#!/usr/bin/env zsh

setopt SH_WORD_SPLIT

. $(dirname $0)/common.sh

_git=$(which git 2> /dev/null)
if [ -z "$_git" ] || [[ $_git =~ "not found" ]]; then
    echo "You must install git" >&2
    exit 1
fi

parse-option $@

target_files=$(find . -type f -maxdepth 1 -name '\.*' | grep -vE '^$' | grep -vE '^\.+$' | grep -v '.bashrc' | sed -e 's/^\.*\/\(.*\)/\1/g')

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
        if is-ignore $file; then
            continue
        fi
        if is-locked $file; then
            continue
        fi
        echo "  ${file}"
    done
    echo ;
}

inspect

read "yn?Do you install this settings?[y/n]"

case $yn in
    [Yy]* )
    ;;
    * ) echo "Stop to install"; exit 0 ;;
esac

echo "O.K. Transfer process to install"

for file in $target_files; do
    filepath=$curpath/$file

    if is-ignore $file; then
        echo "Skip, that's why ${filepath} is ignored"
        continue
    fi
    if is-locked $file; then
        echo "Skip, that's why ${filepath} is locked"
        continue
    fi

    if [ $file = ".zshrc" ]; then
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

# zsh settings
if [ ! -d ~/.zsh-completions/ ]; then
    git clone git@github.com:zsh-users/zsh-completions.git ~/.zsh-completions/
fi

source ~/.zshrc
