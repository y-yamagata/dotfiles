readonly curpath=$(cd $(dirname $0); pwd)

readonly ignore_file=$curpath/setup.ignore
readonly lock_file=$curpath/setup.lock

ignores=`cat ${ignore_file}`
locks=
if [ -f $lock_file ]; then
    locks=`cat ${lock_file}`
fi

function is-ignore {
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

function is-locked {
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

withvim=false
withneovim=false
withemacs=false

function parse-option {
    while [ -n "$1" ]; do
        case "$1" in
            "--vim")
                withvim=true
            ;;
            "--neovim")
                withneovim=true
            ;;
            "--emacs")
                withemacs=true
            ;;
        esac
        shift
    done
}
