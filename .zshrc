####################### zinit #######################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

# 補完
zinit light zsh-users/zsh-autosuggestions

# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting

# Ctrl+r でコマンド履歴を検索
zinit light zdharma/history-search-multi-word

## コマンド補完
zinit ice wait'0'; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit

## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1

### End of Zinit's installer chunk

#################################  HISTORY  #################################
# history
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する

#################################  COMPLEMENT  #################################

source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
####################### zinit #######################

# goPATH
#export PATH="$GOROOT/bin:$PATH"
#export PATH="$PATH:$GOPATH/bin"

# rbenvPATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# alias
alias be='bundle exec'
alias bi='bundle install'
alias ls='ls -G'
alias rg='be rails g'
alias rs='be rails s -b 0.0.0.0'
alias rspec='be rspec'
alias rspecf='rspec --tag focus'
alias ru='be rubocop -a'
#alias :q='exit'

# alias:cd
alias cdd="cd $HOME/Desktop"

# alias:git
alias g="git"
alias l="git log"
alias lo="git log --oneline"
alias s="git status"
alias a="git add"
alias re="git reset"
alias f="git fetch --prune"
alias rb="git rebase"
alias cm="git commit"
#alias m="git merge"
alias b="git branch"
alias br="git branch -r"
#alias bdall="git branch --merged | grep -v '*' | xargs -I % git branch -d %"
alias ch="git cherry-pick"
#alias co="git checkout"
alias sw="git switch"
#alias rt="git restore"
#alias cow="git checkout working"
#alias cod="git checkout develop"
#alias com="git checkout master"
#alias sww="git switch working"
#alias swd="git switch develop"
#alias swm="git switch master"
#alias d="git diff"
#alias ds="git diff --staged"
alias f="git fetch --prune"
alias push="git push origin HEAD"
alias fpush='git push -f origin HEAD'
alias pull="git pull origin HEAD"
#alias show="git show"
#alias st="git stash"
