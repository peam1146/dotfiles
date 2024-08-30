# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.secret.sh

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export GPG_TTY=$(tty)

export JAVA_HOME="/Users/peam/Library/Java/JavaVirtualMachines/jdk-21.0.1.jdk/Contents/Home/"
export CRYPTO_DIR="/usr/local"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export CAPACITOR_ANDROID_STUDIO_PATH="/Users/peam/Library/Android/sdk"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="code"

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

export HISTFILESIZE=-1
export HISTSIZE=1000000
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
		. "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
	else
		export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/Users/peam/fvm/default/bin:$PATH"
export PATH="$HOME/.pub-cache/bin:$PATH"

eval "$(jump shell)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

eval "$(rbenv init - zsh)"
eval "$(zoxide init --cmd cd zsh)"

# source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm'
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM=1

# pnpm
export PNPM_HOME="/Users/peam/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"

# hash
hash -d snt="$HOME/work/softnetics"
hash -d work="$HOME/work"

# create hash for all directory in work
for d in $HOME/work/*; do
  hash -d $(basename $d)="$d"
done

# alias
alias k=kubectl
alias ls=lsd
alias work="cd ~/work"
alias snt="cd ~/work/softnetics"
alias softnetics="cd ~/work/softnetics"
alias reload="source ~/.zshrc && echo 'Reloaded ~/.zshrc'"
alias d="kitty +kitten diff"
alias icat="kitty +kitten icat"
alias s="kitty +kitten ssh"
alias g="git"


# fzf completion
# export FZF_COMPLETION_OPTS='--border'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


zinit ice lucid wait
zinit light chitoku-k/fzf-zsh-completions

zinit ice lucid wait
zinit light zsh-users/zsh-autosuggestions

zinit ice lucid wait
zinit light zsh-users/zsh-syntax-highlighting

zinit ice lucid wait
zinit light akash329d/zsh-alias-finder

zinit ice lucid wait
zinit light Cloudstek/zsh-plugin-appup

zinit ice lucid wait
zinit light joshskidmore/zsh-fzf-history-search

zinit ice lucid wait
zinit light goarano/zsh-packagemanager-fzf

zinit ice lucid wait
zinit light voronkovich/project.plugin.zsh

zinit ice lucid wait
zinit light voronkovich/gitignore.plugin.zsh

zinit ice lucid wait
zinit light hlissner/zsh-autopair

zinit ice lucid wait
zinit light marlonrichert/zsh-autocomplete

zinit ice depth=1
zinit light romkatv/powerlevel10k
# override fzf completion to exclude hidden files

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
# _fzf_compgen_path() {
#   fd --follow --exclude "node_modules" . "$1"
# }

# Use fd to generate the list for directory completion
# _fzf_compgen_dir() {
#   fd --type d --follow --exclude "node_modules" . "$1"
# }

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/peam/.config/.dart-cli-completion/zsh-config.zsh ]] && . /Users/peam/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# bun completions
[ -s "/Users/peam/.bun/_bun" ] && source "/Users/peam/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
