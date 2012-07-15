#!/bin/bash
#
#  Copyright © 2012 bjarneh@ifi.uio.no
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.


ANSI_GREEN="\[\033[0;32m\]"
ANSI_NORMAL="\[\033[0m\]"


function is_svn(){
    if [ -d "${PWD}/.svn" ]; then
        echo -n "(svn) "
        return 0
    fi
    return 1
}

function is_modern_repo(){

    local work_dir ex_status repo_type

    repo_type="${1}"
    work_dir="${PWD}"
    ex_status=1

    while [ ! -z "${work_dir}" ];
    do
        if [ -d "${work_dir}/.${repo_type}" ]; then
            echo -en "(${repo_type}) "
            ex_status=0
            break
        fi

        work_dir="${work_dir%/*}"

    done

    return "${ex_status}"
}

function is_repo {

    is_svn && return 0
    is_modern_repo "git" && return 0
    is_modern_repo "hg" && return 0
    is_modern_repo "bzr" && return 0

    return 1
}

export PS1="\u@\h:\W${ANSI_GREEN} \$(is_repo)${ANSI_NORMAL}\$ "
