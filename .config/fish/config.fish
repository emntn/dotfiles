set -Ux PAGER less
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set fish_greeting

starship init fish | source

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Open man with Neovim
export MANPAGER='nvim +Man!'
export MANWIDTH=80

alias jf="cd ~/notes && sh ~/.scripts/journal/load_journal.sh && sh ~/.scripts/journal/journal.sh"
alias save="sh ~/.scripts/journal/save_journal.sh"
alias wk="cd ~/notes && sh ~/.scripts/weekly/weekly.sh && cd -"
alias ls="eza -al --group-directories-first --no-quotes"
alias vim="nvim"
alias mutt="neomutt"
alias duck="sh ~/.scripts/duck.sh"
alias weather="curl wttr.in/turku\?MFQ"

# tmux
alias base="sh ~/.scripts/tmux/base.sh"
alias pro="sh ~/.scripts/tmux/project.sh"

# Work related
alias work="cd ~/notes && sh ~/.scripts/log/log.sh && cd -"
alias twork="sh ~/.scripts/tmux/work.sh"
alias epsilon="ssh "
alias puhti="ssh "
alias mahti="ssh "
alias lumi="ssh -i .ssh/id_rsa_lumi "
