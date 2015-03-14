# Colors
_ps1_red="\e[31m"
_ps1_green="\e[32m"
_ps1_yellow="\e[33m"
_ps1_blue="\e[34m"
_ps1_purple="\e[35m"
_ps1_cyan="\e[36m"
_ps1_reset="\e[00m"

# PS1 parts
function _ps1_result() {
    code=$?
    if [ ${code} == 0 ]; then
        echo -e "${_ps1_blue}"'(っ*´∀`*)っ OK!!'" [${code}]${_ps1_reset}"
    else
        echo -e "${_ps1_red}"'(｡´･ω･`) NG...'" [${code}]${_ps1_reset}"
    fi
}
_ps1_user="${_ps1_green}\u@\h${_ps1_reset}"
_ps1_dir="${_ps1_cyan}\w${_ps1_reset}"
function _ps1_git() {
    echo -e "${_ps1_yellow}$(__git_ps1 2>/dev/null)${_ps1_reset}"
}
_ps1_prompt="\$ "

# PS1
export PS1="\n\$(_ps1_result)\n${_ps1_user}:${_ps1_dir}\$(_ps1_git)\n${_ps1_prompt}"
