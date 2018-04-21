export HISTSIZE=10000
export HISTTIMEFORMAT="%m/%d %H:%M:%S "

if [[ :$PATH: != *:$HOME/bin:* ]]; then
    export PATH="$PATH:$HOME/bin"
fi


function _prompt_initialize() {

    local reset='\[\e[00m\]'
    local green='\[\e[32m\]'
    local yellow='\[\e[33m\]'
    local cyan='\[\e[36m\]'

    local user='\u'
    local host='\H'
    local dir='\w'
    local newline='\n'
    local prompt='\$'
    local git='`__git_ps1 2>/dev/null`'

    PROMPT_COMMAND="_prompt_command"
    PS1="${green}${user}@${host}${reset}"
    PS1="${PS1}:${cyan}${dir}${reset}"
    PS1="${PS1}${yellow}${git}${reset}"
    PS1="${PS1}${newline}"
    PS1="${PS1}${prompt} "
    PS2="> "
    PS3="#? "
    PS4="+ "

}

function _prompt_command() {
    local status=$?
    local reset="\e[00m"
    local blue="\e[34m"
    local red="\e[31m"
    printf "\n"
    if [ ${status} = 0 ]; then
        printf "${blue}"'(っ*´∀`*)っ OK!!'" [${status}]${reset}\n"
    else
        printf "${red}"'(｡´･ω･`) NG...'" [${status}]${reset}\n"
    fi
}

_prompt_initialize
