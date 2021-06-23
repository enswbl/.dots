
# ╔════════════════════════════════════════════════════════════════════════════╗
# ║                                                                            ║
# ║       ________  ________  ___  ___  _______   ___       ___                ║
# ║      |\_____  \|\   ____\|\  \|\  \|\  ___ \ |\  \     |\  \               ║
# ║       \|___/  /\ \  \___|\ \  \\\  \ \   __/|\ \  \    \ \  \              ║
# ║           /  / /\ \_____  \ \   __  \ \  \_|/_\ \  \    \ \  \             ║
# ║          /  /_/__\|____|\  \ \  \ \  \ \  \_|\ \ \  \____\ \  \____        ║
# ║         |\________\____\_\  \ \__\ \__\ \_______\ \_______\ \_______\      ║
# ║          \|_______|\_________\|__|\|__|\|_______|\|_______|\|_______|      ║
# ║                   \|_________|                                             ║
# ║                                                                            ║
# ║                                                                            ║
# ╚════════════════════════════════════════════════════════════════════════════╝
# for i in $(seq 1 10); do /usr/bin/time /bin/zsh -i -c exit; done;
# zinit times -m / -ms

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
### End of Zinit's installer chunk

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                                - PLUGINS -                                ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh' atload"
PURE_PROMPT_SYMBOL=▲
PURE_PROMPT_SYMBOL_COLOR=magenta
PURE_PROMPT_PATH_FORMATTING=%c/"
zinit light dfurnes/purer

zinit ice wait lucid atload"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[autodirectory]=none"
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light agkozak/zsh-z

zinit ice wait lucid
zinit light lukechilds/zsh-nvm

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║                                - SETTINGS -                                ║
# ╚════════════════════════════════════════════════════════════════════════════╝

export EDITOR='subl -w'

HISTSIZE=8000
SAVEHIST=10000

setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

setopt autocd
setopt autopushd

setopt correct
setopt correct_all

NVM_LAZY_LOAD=true

export _Z_DATA=~/.config/z/.z

export PYTHONSTARTUP=~/.config/python/.pythonrc

eval "$(/opt/homebrew/bin/brew shellenv)"

# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                                - ALIASES -                                ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

alias zshc="$EDITOR ~/.config/zsh/.zshrc"

alias ls="exa"

alias ms="brew services start mongodb-community"
alias mst="brew services stop mongodb-community"

alias bbrew="brew bundle dump; mv ~/brewfile ~/.dots/brewfile"

alias bnpm="npm list -g --depth 0 > npmlist.txt; mv ~/npmlist.txt ~/.dots/npmlist.txt"
# alias bpip="pip3 list > piplist.txt; mv ~/piplist.txt ~/.dots/piplist.txt"

alias bvscode="code --list-extensions > ~/.dots/vscode/extensions.txt"

alias showdots="defaults write com.apple.finder AppleShowAllFiles true ; killall Finder"
alias hidedots="defaults write com.apple.finder AppleShowAllFiles false ; killall Finder"