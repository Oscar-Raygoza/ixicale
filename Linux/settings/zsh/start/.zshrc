# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ixicale/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnosterzak"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#region vars
# Set envoirement linux's variables
export UBUN_HTTP="/var/www/html"
export PYTHON="$UBUN_HTTP/PYTHON"
export NODE="$UBUN_HTTP/NODE"
export PHP="$UBUN_HTTP/PHP"

export SF="$HOME/.sf"
export MY_BASH="$SF/SteampunkFactory-Bash"
export MY_CONF="$SF/SteampunkFactory-MySettings"
export MY_LOOT="$SF/SteampunkFactory-Loot"
export MY_TEMPLATE="$MY_CONF/templates/"
export RUN_BASH="$MY_CONF/develop/bash"
export POSTMAN_LOG="$MY_CONF/logger/postman"
# # Set envoirement linux's variables
# export MNJR_P_HTTP="/srv/http"
# export MNJR_PYTHON="$MNJR_P_HTTP/clv_python"
# export MNJR_NODE="$MNJR_P_HTTP/NODE"
# export MNJR_PHP="$MNJR_P_HTTP/PHP"
# # Set DEV's path projects
# export MANJARO_DEV_CLV_BENEFIT_API="$MNJR_PHP/clv-benefit-api"
# export MANJARO_DEV_CLV_BENEFIT_FE="$MNJR_NODE/clv-benefit-fe"
# export MANJARO_DEV_CLV_REPORT_API="$MNJR_PYTHON/clv-report-api"
# export MANJARO_DEV_CLV_COMMON_PY="$MNJR_PYTHON/clv_common_py"
# # Set own project's path
# export MANJARO_PATH_X_FACTORY="$MNJR_P_HTTP/x_factor"
# export MANJARO_PATH_MY_LOOT="$MNJR_P_HTTP/x_factor/SteampunkFactory-Loot"
# export MANJARO_PATH_MY_SETTINGS="$MNJR_P_HTTP/x_factor/SteampunkFactory-MySettings"
# export MANJARO_PATH_MY_PYTHON="$MNJR_P_HTTP/x_factor/SteampunkFactory-Python"
# export MANJARO_PATH_MY_BASH="/home/isaias/SteampunkFactory-Bash"
# # Set easy access commands
# export EDIT_ZSH='atom ~/.zshrc'
# export PYTHON_INIT_VENV='bash ~/SteampunkFactory-Bash/python_executer.setup_install.sh'
# export PYTHON_EXEC='bash ~/SteampunkFactory-Bash/python_executer.sh'
#endregion

#region alias
# alias postman='~/Postman/Postman'
alias gis='git status'
alias gic='git checkout'
alias gif='git fetch --all'
alias gime='git merge'
alias gips='git push'
alias gipl='git pull'
alias gicx='git checkout ixicale'
alias gimex='git merge ixicale'
installNODE () { cd $NODE; PROYECT="$1"; echo "Project -> $PROYECT";rm -rf $NODE/$PROYECT; git clone git@github.com:fbenitez/$PROYECT.git; $NODE/$PROYECT; gic dev; npm i; npm run dev; }
installPHP () { cd $PHP; PROYECT="$1"; echo "Project -> $PROYECT";rm -rf $PHP/$PROYECT; git clone git@github.com:fbenitez/$PROYECT.git; gic dev; composer install --ignore-platform-reqs; }
logPostman () { _time=`date +%Y.%m%b.%d.%H%M%S%N.%A`; destiny="$POSTMAN_LOG/$_time.logger"; echo $destiny; ~/Postman/Postman >> $destiny & }
logOpera () { _time=`date +%Y.%m%b.%d.%H%M%S%N.%A`; destiny="$POSTMAN_LOG/$_time.logger"; echo $destiny; opera >> $destiny & }
rst () { source ~/.zshrc; echo -e "\t==================\n\tSe reinicio la consola!\n\t==================" }
TEMPLATE_issues () { cat $MY_TEMPLATE/issues.md ; cat $MY_TEMPLATE/issues.md | xclip -sel clip; }
copyColapse () { DOC_STR_TEMPLATE="<details>\n  <summary>\n\n  </summary>\n  <p>\n\n    Hola Mundo\n\n  </p>\n</details>"; echo -e $DOC_STR_TEMPLATE; echo -e $DOC_STR_TEMPLATE | xclip -sel clip; }
#endregion
