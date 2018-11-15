#!/bin/bash

#
# Error Messages
# 0 success
# 1 invalid input
# 2 run error
#
# Globals
FilesNumber=0
FilesName=
LocaleSettings=
# Functions
unset_vars() {
    FilesNumber=
    FilesName=
    LocaleSettings=
}

show_help() {
    if [[ LocaleSettings == 'UA' ]]; then
        show_help_UA
    else
        show_help_EN
    fi
}

set_locale_var() {
    LocaleSettings='EN'
    if [[ $LANG == 'uk_UA.utf8' ]]; then
        LocaleSettings='UA'
    fi
}

show_help_EN() {
    echo 'task1.sh [-h|--help] [-n num] [file]'
    echo '  -h,--help   shows this manual'
    echo '  -n num      makes *num* number of files with system information report'
    echo '  file        report filename'
    unset_vars
    exit 0
}

show_help_UA() {
    echo 'task1.sh [-h|--help] [-n num] [file]'
    echo '  -h,--help   виводить мануал'
    echo '  -n num      кiлькiсть файлiв'
    echo '  file        найменування файлу'
    unset_vars
    exit 0
}

error_message() {
    if [[ LocaleSettings == 'UA' ]]; then
        error_input $1 "$2"
    else
        error_input $1 "$3"
    fi
}

error_input() {
    echo $1 $2 $3 >&2
    unset_vars
    exit 1
}

create_path() {

}

rename_old_files() {

}



#
set_locale_var
# parse input
while [[ -n "$1" ]]; do
    case $1 in
        -n ) shift
            FilesNumber=$1
            echo "FilesNumber=$FilesNumber"
            if [[ $((FilesNumber+0)) == '0' ]]; then
                error_message "arg=$1" "Помилка: Хибний ввод" "Error: Invalid input"
            fi
            ;;
        -h ) show_help;;
        --h) show_help;;
        * )
            if [[ -z $FilesName ]]; then
                FilesName=$1
                echo "FilesName=$FilesName"
            else
                error_message "arg=$1" "Помилка: Хибний ввод" "Error: Invalid input"
            fi
    esac
    shift
done
#

#