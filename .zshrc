# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#export MODULAR_HOME="/home/b0llull0s/.modular"
#export PATH="/home/b0llull0s/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh
# User configuration
## Pywal ##
cat ~/.cache/wal/sequences
#cat ~/.cache/wal/sequences
## PATHS ##

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases ca be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
## Aliases ##
alias rmdir='rm -rf'
alias cwipe='cliphist wipe'
alias usb1="sudo mount /dev/sda1 /mnt"
alias pac="sudo pacman -S"
alias wclass="xprop | grep 'CLASS'"
alias syst='systemctl status'
alias syse='systemctl enable'
alias sysd='systemctl disable'
alias syss='systemctl start'
alias cya='shutdown -h now'
alias audio='pavucontrol'
alias up='sudo pacman -Syu'
alias ls='exa -al'
alias kat='bat'
alias ga='git add .'
alias gaa='git add --all'
alias gc="git commit -m $1"
alias gpo='git push -u origin main'
alias gp='git push'
alias gpl='git pull'
alias ps1='ps -auxwf'
alias psg='ps -ef | grep'
alias dz='aunpack'
alias pacsize='LC_ALL=C.UTF-8 pacman -Qi | awk '\''/^Name/{name=$3} /^Installed Size/{print $4$5, name}'\'' | LC_ALL=C.UTF-8 sort -h | grep'
alias pacc='sudo pacman -Scc'
alias ipv6='cat /proc/sys/net.ipv6/conf/all/disable_ipv6'
alias ipv6on='sudo sysctl net.ipv6.conf.all.disable_ipv6=0'
alias ipv6off='sudo sysctl net.ipv6.conf.all.disable_ipv6=1'
alias nc='netcat'
## Functions ##
function cheat() { curl -m 7 "http://cheat.sh/$1"; }
function rmk() { scrub -p dod $1; shred -zun 10 -v $1; }
function walup() { wal -i "$(find ~/Downloads/w4llp4p3rs -type f -name '*.jpeg' | shuf -n 1)"; }
function sshon() { sudo ufw allow 22/tcp; } 
function sshoff() { sudo ufw deny 22/tcp; }
function box() { [ -z "$1" ] && echo "Usage: box <HTB_IP>" || sudo ufw allow from "$1" to any && echo "Traffic allowed from $1"; }
function boxd() { [ -z "$1" ] && echo "Usage: boxd <HTB_IP>" || sudo ufw delete allow from "$1" to any && echo "Traffic rule deleted for $1"; }

