# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1='${debian_chroot:+($debian_chroot)}\u  \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u_\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

Green="\e[38;5;49m"
Red="\e[38;5;184m"
Blue="\e[38;5;81m"
Violet="\e[38;5;105m"
Rst="\e[0m"    # Text Reset
Redbg='\e[41m'   # Red
Greenbg='\e[42m'   # Green
Yellowbg='\e[43m'   # Yellow
Bluebg='\e[44m'   # Blue
Purplebg='\e[45m'   # Purple
Cyanbg='\e[46m'   # Cyan
Whitebg='\e[47m'   # White


color_black_black='\[\e[0;30m\]'
color_black_red='\[\e[0;31m\]'
color_black_green='\[\e[0;32m\]'
color_black_yellow='\[\e[0;33m\]'
color_black_blue='\[\e[0;34m\]'
color_black_magenta='\[\e[0;35m\]'
color_black_cyan='\[\e[0;36m\]'
color_black_white='\[\e[0;37m\]'

color_red_black='\[\e[30;41m\]'
color_red_red='\[\e[31;41m\]'
color_red_green='\[\e[32;41m\]'
color_red_yellow='\[\e[33;41m\]'
color_red_blue='\[\e[34;41m\]'
color_red_magenta='\[\e[35;41m\]'
color_red_cyan='\[\e[36;41m\]'
color_red_white='\[\e[37;41m\]'

color_green_black='\[\e[30;42m\]'
color_green_red='\[\e[31;42m\]'
color_green_green='\[\e[32;42m\]'
color_green_yellow='\[\e[33;42m\]'
color_green_blue='\[\e[34;42m\]'
color_green_magenta='\[\e[35;42m\]'
color_green_cyan='\[\e[36;42m\]'
color_green_white='\[\e[37;42m\]'

color_yellow_black='\[\e[30;43m\]'
color_yellow_red='\[\e[31;43m\]'
color_yellow_green='\[\e[32;43m\]'
color_yellow_yellow='\[\e[33;43m\]'
color_yellow_blue='\[\e[34;43m\]'
color_yellow_magenta='\[\e[35;43m\]'
color_yellow_cyan='\[\e[36;43m\]'
color_yellow_white='\[\e[37;43m\]'

color_blue_black='\[\e[30;44m\]'
color_blue_red='\[\e[31;44m\]'
color_blue_green='\[\e[32;44m\]'
color_blue_yellow='\[\e[33;44m\]'
color_blue_blue='\[\e[34;44m\]'
color_blue_magenta='\[\e[35;44m\]'
color_blue_cyan='\[\e[36;44m\]'
color_blue_white='\[\e[37;44m\]'

color_magenta_black='\[\e[30;45m\]'
color_magenta_red='\[\e[31;45m\]'
color_magenta_green='\[\e[32;45m\]'
color_magenta_yellow='\[\e[33;45m\]'
color_magenta_blue='\[\e[34;45m\]'
color_magenta_magenta='\[\e[35;45m\]'
color_magenta_cyan='\[\e[36;45m\]'
color_magenta_white='\[\e[37;45m\]'

color_cyan_black='\[\e[30;46m\]'
color_cyan_red='\[\e[31;46m\]'
color_cyan_green='\[\e[32;46m\]'
color_cyan_yellow='\[\e[33;46m\]'
color_cyan_blue='\[\e[34;46m\]'
color_cyan_magenta='\[\e[35;46m\]'
color_cyan_cyan='\[\e[36;46m\]'
color_cyan_white='\[\e[37;46m\]'

color_grey_black='\[\e[30;47m\]'
color_grey_red='\[\e[31;47m\]'
color_grey_green='\[\e[32;47m\]'
color_grey_yellow='\[\e[33;47m\]'
color_grey_blue='\[\e[34;47m\]'
color_grey_magenta='\[\e[35;47m\]'
color_grey_cyan='\[\e[36;47m\]'
color_grey_white='\[\e[37;47m\]'

color_reset='\[\033[0m\]'

#separator=''
#separator='❯'
separator=''

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
export EDITOR=nano

alias ls='ls --color'
alias ll='ls -lah'


function genprompt () {
	EXIT="$?";

	if [ $EXIT != 0 ]; then
		#PS1="\[$Redbg\]\[$Red\]\u@\[$Blue\]\h \[$Bluebg\]\[$Violet\]\w  \[$Rst\]"
		PS1="$color_red_black\u$color_yellow_red$separator$color_yellow_black\h$color_red_yellow$separator$color_red_white \w$color_black_red$separator$color_reset \n$ "
#		PS1="$color_red_white\u@\h$color_blue_red$separator$color_blue_black \w$color_black_blue$separator$color_reset"

	else
		#PS1="\[$Green\]\u@\[$Blue\]\h \[$Violet\]\w  \[$Rst\]"
		PS1="$color_green_white\u$color_yellow_green$separator$color_yellow_black\h$color_red_yellow$separator$color_red_white \w$color_black_red$separator$color_reset \n$ "		
	fi
}

#export PS1="$Violet\u $Rst"
export PROMPT_COMMAND=genprompt

