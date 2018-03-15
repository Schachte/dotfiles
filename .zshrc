# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/schachte/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#######################
#	CXTA
#######################
export debug=-Dmaven.surefire.debug="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 -Xnoagent -Djava.compiler=NONE"
alias qb="mvn clean install -DskipStatic=true -DwebBuildEnv=dev -DskipTests=true -T 2C -DfailIfNoTests=false -pl '\!distribution/docs'"
alias f="mvn fmt::format"
alias ddf="cd /Users/schachte/Documents/Github/ddf"
alias gsr="cd /Users/schachte/Documents/Github/gsr/gsr-yorktown"
alias deploy_gsr="ddf && cd distribution/ddf/target && unzip -o ddf-*.zip && cd ../../.."
alias deploy_ddf="gsr && cd distribution/gsr/target && unzip -o gsr-*.zip && cd ../../.."

#######################
#	APPS
#######################
alias slack="open /Applications/Slack.app"
alias outlook="open /Applications/Microsoft\ Outlook.app/"
alias calendar="open /Users/schachte/Documents/calendar.webloc"
alias vscode="open /Applications/Visual\ Studio\ Code.app/"
alias intellij="open /Applications/IntelliJ\ IDEA.app/"
alias morning="slack && outlook && calendar && vscode && intellij"

#######################
#	GITHUB
#######################

# $1 remote
# $2 ID
# $3 Branch Name
# $4 Checkout Branch Name (Optional)
review() {
	if [[ -n "$4" ]]
	then
		git fetch "$1" pull/"$2"/head:"$3" && git checkout "$4"
	else
		git fetch "$1" pull/"$2"/head:"$3"
	fi
}

commit(){
	branch_name="$(git rev-parse --abbrev-ref HEAD)"
	message="$branch_name ${@:1}"
	echo "git commit -m $message"
	git commit -m $message
}

#######################
#	MISC
#######################

# Directory finder
finddir() {
	find . -name "$1" -type d
}

# Current dir to clipboard
alias copydir="pwd | pbcopy"

# Note Management Repository
THEDATE=`gdate`
alias pushnotes="git add * && git commit -m 'Auto commit notes $THEDATE' && git push origin master"

alias edit='vim ~/.zshrc'
alias update='source ~/.zshrc'
alias pomo='cd /Users/schachte/scripts && source pomo.sh pomo && pomo'
