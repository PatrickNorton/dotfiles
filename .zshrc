# Ensure that the terminal uses 256 colors
export TERM="xterm-256color"

# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:/Users/patricknorton/.local/bin:/Users/patricknorton/opt/GNAT/2018/bin/:$HOME/.cargo/bin

# Path to your oh-my-zsh installation.
export ZSH=/Users/patricknorton/.oh-my-zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  thefuck
  zsh-syntax-highlighting
  python
)


# Source powerlevel9k customisations
# This has to be before the oh-my-zsh source in order to load symbols properly
source ~/Projects/dotfiles/.pl9k.zsh

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Setting up pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# Set up z
# . `brew --prefix`/etc/profile.d/z.sh

# Set up zsh-autocomplete
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NEWLANG_PATH=""

alias a2weather='ansiweather -l "Ann Arbor,US" -s true -d true'

alias weather=ansiweather

eval $(thefuck --alias)

alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport'

alias tree="tree -C"

alias menuscript='~/Desktop/Python\ files/Lunchdisper.py'

alias wisecow='fortune | cowsay'

alias git=hub

alias emptygit=4b825dc642cb6eb9a060e54bf8d69288fbee4904

alias please=sudo


# Personal functions

sympy() {
    python ~/Projects/Python\ files/Sympymath.py
}

sysinfo() {
    open /Applications/Utilities/System\ Information.app
}

lunch() {
    python menuscript
}

solitaire() {
    python ~/Projects/Python\ files/Solitaire4.py
}

chess() {
    python ~/Projects/Python\ files/Ultrachess.py
}

compose() {
    open -a Musescore\ 3
}

emptydiff() {
    git diff --stat $githash $emptygit
}

githash() {
    git rev-parse HEAD
}

clocgit() {
    cloc $@ $(git rev-parse HEAD)
}

old-words() {
    (cd ~/words && ./words $@)
}

words() {
    (cd ~/whitakers-words && bin/words $@)
}

brewgrade() {
    brew upgrade
    brew cask upgrade
}

randint() {
    if [[ $# -eq 1 ]]; then
        shuf -i 0-$1 -n 1
    else
        shuf -i $1-$2 -n 1
    fi
}

shouldi () {
    if (( $RANDOM % 2 )); then
        echo yes
    else
        echo no
    fi
}

reload() {
    source ~/.zshrc
}

# newlang() {
#     local file=$1
#     $(cd ~/IdeaProjects/Compiler/out/production/Compiler && java -cp . main.java.parser.Compiler "$file" > /dev/null)
#     if $?; then
#         local bytecode=${file%.*}
#         ~/CLionProjects/Runtime/cmake-build-debug/Runtime "${bytecode}.nbyte"
#     fi
# }

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export HOMEBREW_GITHUB_API_TOKEN=bcfe52b38eb614954285c5ea1524b8d858ab0d19
