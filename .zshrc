#
# User configuration sourced by interactive shells
#


# load zgen
source "${HOME}/.zgen/zgen.zsh"
# if the init script doesn't exist
 if ! zgen saved; then

   # specify plugins here
   zgen oh-my-zsh

   # generate the init script from plugins above
   zgen save
   fi

zgen load urbainvaes/fzf-marks

# Define zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# If you come from bash you might have to change your $PATH.  # export PATH=$HOME/bin:/usr/local/bin:$PATH # Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_UPDATE=true


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
#ZSH_THEME="avit"
#ZSH_THEME="spaceship"
#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="minimal"
#ZSH_THEME="refined"
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
SPACESHIP_TIME_PREFIX="jam "
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

#MINIMAL THEME
# Components on the left prompt
MNML_PROMPT=(mnml_status mnml_keymap )
#MNML_PROMPT=(mnml_status 'mnml_cwd 3 6' mnml_keymap)
#MNML_PROMPT=(mnml_status mnml_keymap)
# Components on the right prompt
MNML_RPROMPT=('mnml_cwd 3 0')
# Components shown on info line
MNML_INFOLN=( mnml_err mnml_jobs mnml_uhp mnml_files)

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
 DISABLE_AUTO_UPDATE="true"

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
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/lib/minimal.zsh
source ~/Documents/bangunapp/fzf-marks/fzf-marks.plugin.zsh

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

alias memo="systemd-analyze && neofetch && inxi -G && curl wttr.in/Purwokerto\?0"
alias q="reset && ~"
alias pp="pwd"
alias hello="sys && wttr && anal"
alias mt="neomutt"
alias xwin="xwininfo"
alias boot="icy && uname -r && systemd-analyze"
alias goo="googler"
alias v="vim"
alias tulis="figlet -f ~/Documents/bangunapp/figlet-fonts/3d.flf"
alias sv="sudo vim"
alias la="ls -a"
alias yd="youtube-dl --youtube-skip-dash-manifest -f 18"
alias yf="youtube-dl"
alias ym="youtube-dl --youtube-skip-dash-manifest -x --audio-format m4a --audio-quality 0 --embed-thumbnail"
alias asu="screenfetch -E -D archlinux -w"
alias hack="hackersascii"
alias lla="ls -al"
alias wlist="nmcli device wifi list"
alias wconn="nmcli connection show"
alias x="exit"
alias f="fff"
alias ra="ranger"
alias m="mounts"
alias um="unmount"
#alias qq="q && bunnyfetch"
alias qq="q && boot"
alias cek="sudo pacman -Syyuu"
alias shot="scrot -c -d 10"
alias konek="nmtui"
alias musik="mpd && ncmpcpp"
alias mix="ncpamixer"
alias mm="sudo ~/Documents/scripts/ps_mem.py"
alias ff="free -h"
alias swap="cat /proc/sys/vm/swappiness"
alias cpol="vim ~/.config/polybar/config"
alias cdo="vim ~/.config/polybar/configdock"
alias sapu="sapu"
alias mupen="mupen64plus"
alias baca="fltrdr"
alias benchssd="dd if=./largefile of=/dev/null bs=4k && dd if=/dev/zero of=./largefile bs=4k count=1024"
alias host="bunnyfetch"
alias nf="neofetch"
alias beras="bunnyfetch  && curl -L git.io/rice"
alias note="notetaking"
alias ci3="vim ~/.config/i3/config"
alias cz="vim ~/.zshrc"
alias sz="source ~/.zshrc"
alias hg="history | grep"
alias lg="ls | grep"
alias mpvyt="youtube-viewer --resolution=360p"
alias pron="mpv /home/damez/Mail/a30"
alias mov="mpv /home/damez/Videos/film"
alias tut="mpv /home/damez/Videos/linux"
alias tv="mpv --force-window -autofit 500x280 --shuffle /home/damez/Documents/iptv"
alias mts="dmenumount"
alias wals="wal -f Documents/colorscheme/solarizedd.txt"
alias walf="wal -l  --theme github"
alias um="dmenuumount"
alias build="make && sudo make install"
alias acc="acestream-launcher --player mpv"
alias tmx="tmux attach"
alias cx="vim ~/.Xresources"
alias cv="vim ~/.vimrc"
alias catx="cat ~/.xsession-errors"
alias bd="cd .."
alias ww="hexfetch"
alias mut="hexfetch"
alias fetch="toy"
alias wall="wal -f Documents/colorscheme/yousai.txt"
alias wald="wal -f Documents/colorscheme/hybrid.txt"
alias tt="trizen"
alias cpu="sudo cpu-x -n"
alias cpro="vim ~/.profiles"
alias wee="weechat"
alias sr="surfraw -browser=w3m"
alias surfraw="surfraw -browser=qutebrowser"
alias hbcli="HandBrakeCLI --preset-import-file ~/Documents/scripts/videosa.json "videosa""
alias siri="betty/main.rb"

fzf-dmenu() {
	# note: xdg-open has a bug with .desktop files, so we cant use that shit
	selected="$(ls /usr/share/applications | fzf -e)"
	nohup `grep '^Exec' "/usr/share/applications/$selected" | tail -1 | sed 's/^Exec=//' | sed 's/%.//'` >/dev/null 2>&1&
}
fzf-surfraw() { surfraw "$(cat ~/.config/surfraw/bookmarks | sed '/^$/d' | sort -n | fzf -e)" ;}

# hotkey to run the function (Ctrl+O)
bindkey -s '^O' "fzf-dmenu\n"


#autorun
PATH="$HOME/Documents/scripts:$PATH"
export PATH
PATH="$HOME/Documents/catatan:$PATH"
export PATH
PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export PATH

export EDITOR=vim

#if [[ -z "$TMUX" ]]; then
#        tmux attach
#fi


if [ -d "$HOME/git/kodi-playercorefactory/bash-scripts" ] ; then
        PATH="$HOME/git/kodi-playercorefactory/bash-scripts:$PATH"
fi

DISABLE_AUTO_TITLE="true"

export TERM=screen-256color

alias webcam-disable="echo 'blacklist uvcvideo' | sudo tee /etc/modprobe.d/blacklist.conf; echo '[Disable] WebCam'"
alias webcam-enable="echo '' | sudo tee /etc/modprobe.d/blacklist.conf; echo '[Enable] WebCam'"

streaming() {
     INRES="1366x768" # input resolution
     OUTRES="1366x768" # output resolution
     FPS="15" # target FPS
     GOP="30" # i-frame interval, should be double of FPS,
     GOPMIN="15" # min i-frame interval, should be equal to fps,
     THREADS="2" # max 6
     CBR="1000k" # constant bitrate (should be between 1000k - 3000k)
     QUALITY="ultrafast"  # one of the many FFMPEG preset
     AUDIO_RATE="44100"
     STREAM_KEY="live_430136061_Mj3w0aW7MkjayA9SujNk8FWZ0CfBeB" # use the terminal command Streaming streamkeyhere to stream your video to twitch or justin
     SERVER="live-sin" # twitch server in California, see http://bashtech.net/twitch/ingest.php to change

     ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :0.0 -f alsa -i pulse -f flv -ac 2 -ar $AUDIO_RATE \
       -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
       -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
       -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
 }

# choose a player (default is cvlc)
#ACE_PLAYER=cvlc
 ACE_PLAYER=mpv

fzf-dmenu() {
	# note: xdg-open has a bug with .desktop files, so we cant use that shit
	selected="$(ls /usr/share/applications | fzf -e)"
	nohup `grep '^Exec' "/usr/share/applications/$selected" | tail -1 | sed 's/^Exec=//' | sed 's/%.//'` >/dev/null 2>&1&
}

#Select the Terminus Powerline Font if we are in a TTY
case $(tty) in
        (/dev/tty[1-9])
        setfont ter-powerline-v18n
        $HOME/.local/bin/tty-solarized-dark.sh
        ;;
esac

# setup pyenv (you should also put these three lines in .bashrc or similar)
export PATH="${HOME}/.pyenv/bin:${PATH}"
export PYENV_ROOT="${HOME}/.pyenv"
eval "$(pyenv init -)"


# hotkey to run the function (Ctrl+O)
bindkey -s '^O' "fzf-dmenu\n"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#. /home/damez/BangunApp/promptless/promptless.sh
#source /home/damez/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
