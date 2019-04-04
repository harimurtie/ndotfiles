# If you come from bash you might have to change your $PATH.  # export PATH=$HOME/bin:/usr/local/bin:$PATH # Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE=true


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
#ZSH_THEME="avit"
ZSH_THEME="spaceship"
#ZSH_THEME="minimal"
#ZSH_THEME="bira"
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
#  git           # Git section (git_branch + git_status)
#  aws           # Amazon Web Services section
#  venv          # virtualenv section
#  docker
#  kubecontext
#  exec_time     # Execution time
#  jobs          # Background jobs indicator
  time
  battery
#  exit_code
  line_sep      # Line break
  char          # Prompt character
)
SPACESHIP_PROMPT_ORDER=(battery time dir line_sep vi_mode char)

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"

SPACESHIP_DIR_PREFIX="@"
SPACESHIP_DIR_SHOW="true"
SPACESHIP_DIR_TRUNC="0"
SPACESHIP_DIR_TRUNC_REPO="true" #While in git repo, show only root directory and folders inside it
SPACESHIP_DIR_COLOR="cyan"

#SPACESHIP_EXEC_TIME_SHOW="true"
#SPACESHIP_EXEC_TIME_PREFIX="took "
#SPACESHIP_EXEC_TIME_COLOR="yellow"
#SPACESHIP_EXEC_TIME_ELAPSED="5"

#SPACESHIP_USER_SHOW=always
#SPACESHIP_USER_PREFIX=""
#SPACESHIP_USER_SUFFIX=$SPACESHIP_PROMPT_DEFAULT_SUFFIX
#SPACESHIP_USER_COLOR="$COLOR 6"
#SPACESHIP_USER_COLOR_ROOT="red"

SPACESHIP_TIME_SHOW="true"
SPACESHIP_TIME_PREFIX="jam"
SPACESHIP_TIME_COLOR="yellow"
SPACESHIP_TIME_FORMAT="%t"
SPACESHIP_TIME_12hr="true"

#SPACESHIP_JOBS_SHOW="true"
#SPACESHIP_JOBS_PREFIX="running "
#SPACESHIP_JOBS_SYMBOL="\uf144 "
#SPACESHIP_JOBS_COLOR="red"

SPACESHIP_BATTERY_SHOW="true"
SPACESHIP_BATTERY_THRESHOLD="100"
SPACESHIP_BATTERY_SYMBOL_DISCHARGING="dc "
SPACESHIP_BATTERY_SYMBOL_CHARGING="c "
SPACESHIP_BATTERY_COLOR="red"

#SPACESHIP_EXIT_CODE_SHOW="true"
#SPACESHIP_EXIT_CODE_PREFIX="exited "
#SPACESHIP_EXIT_CODE_SYMBOL="✘ "
#SPACESHIP_EXIT_CODE_COLOR="red"

#SPACESHIP_CHAR_PREFIX="╰"
#SPACESHIP_CHAR_SYMBOL="\uF460\uF460\uF460 "

SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_PREFIX=""
SPACESHIP_VI_MODE_SUFFIX=""
SPACESHIP_VI_MODE_INSERT="[I]"
SPACESHIP_VI_MODE_NORMAL="[N]"
SPACESHIP_VI_MODE_COLOR="green"


# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomement the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode git)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias mm="systemd-analyze && neofetch && inxi -G && curl wttr.in/Purwokerto\?0"
alias q="reset"
alias hello="sys && wttr && anal"
alias anal="systemd-analyze"
alias goo="googler"
alias la="ls -a"
alias ll="ls -l"
alias x="exit"
alias f="fff"
alias ra="ranger"
alias m="mounts"
alias um="unmount"
alias qq="reset && ~ && fetch -lavender && colorpanes && curl wttr.in/Purwokerto\?0"
alias cek="sudo pacman -Syyuu"
alias shot="scrot -c -d 10"
alias konek="nmtui"
alias memo="sudo mem.py"
alias musik="mpd && ncmpcpp"
alias mix="ncpamixer"
alias mm="sudo mem.py"
alias ff="free -h"
alias swap="cat /proc/sys/vm/swappiness"
alias sapu="clearcache"
alias mupen="mupen64plus"
alias baca="fltrdr"

#autorun
PATH="$HOME/Documents/scripts:$PATH"
export PATH
PATH="$HOME/Documents/catatan:$PATH"
export PATH
PATH="$HOME/BangunApp/kunst:$PATH"
export PATH

export EDITOR=vim

if [[ -z "$TMUX" ]]; then
        tmux
fi

export TERM=screen-256color

alias webcam-disable="echo 'blacklist uvcvideo' | sudo tee /etc/modprobe.d/blacklist.conf; echo '[Disable] WebCam'"
alias webcam-enable="echo '' | sudo tee /etc/modprobe.d/blacklist.conf; echo '[Enable] WebCam'"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#. /home/damez/BangunApp/promptless/promptless.sh
#source /home/damez/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
