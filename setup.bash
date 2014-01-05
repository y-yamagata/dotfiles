#!/usr/bin/env bash -eu
# setup.bashの場所は変更しないこと

if ! type git > /dev/null 2>&1; then
    echo "git is nothing."
    exit 1
fi

if ! type vim > /dev/null 2>&1; then
    echo "vim is nothing."
    exit 1
fi

if ! type wget > /dev/null 2>&1; then
    echo "wget is nothing."
    exit 1
fi

ignore_files=". .. .git .vim setup.bash README.md .gitmodules .bashrc"

current_path=`pwd`
target_files=`ls -1a | tr '\n' ' '`
for file in $target_files; do
    is_ignore=1
    for ignore_file in $ignore_files; do
        if [ $file = $ignore_file ]; then
            echo "ignore $file"
            is_ignore=0

            break
        fi
    done

    if [ $is_ignore -eq 0 ]; then
        continue
    fi

    filepath="$current_path/$file"

    echo "make synbolic link: $filepath -> ~/$file"
    ln -s $filepath ~/$file
done

git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim/
vim -c "NeoBundleInstall" -c q!

echo "make synbolic link: $current_path/.vim/userautoload -> ~/.vim/userautoload"
ln -s $current_path/.vim/userautoload ~/.vim/userautoload

wget -O ~/.git-completion.bash --no-check-certificate https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
wget -O ~/.git-prompt.sh --no-check-certificate https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
cat .bashrc >> ~/.bashrc

git submodule init
git submodule update

