#!/usr/bin/env bash
# バリデーションとか面倒臭いんでしていないよ
# git, vimは予め入れておくこと
# setup.bashの場所は変更しないこと

# 無視するファイルリスト
ignore_files=". .. .git .vim setup.bash README.md"
# setup.bashとリポジトリルートが同一なことが前提
current_path=`pwd`

target_files=`ls -1a | tr '\n' ' '`
for file in $target_files; do
    # 指定ファイルは無視
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

    # リンクを貼る
    echo "make synbolic link: $filepath -> ~/$file"
    ln -s $filepath ~/$file
done

# neobundle.vimをインストール
git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim/
# vimプラグインをインストール
vim -c "NeoBundleInstall" -c q!
# userautoloadのシンボリックリンクを貼る
echo "make synbolic link: $current_path/.vim/userautoload -> ~/.vim/userautoload"
ln -s $current_path/.vim/userautoload ~/.vim/userautoload

