set -Ux PAGER less
set -Ux EDITOR nvim
set -Ux VISUAL nvim
set fish_greeting
set -g fish_key_bindings fish_vi_key_bindings

starship init fish | source

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Open man with Neovim
export MANPAGER='nvim +Man!'
export MANWIDTH=80

# Replace system tools with modern ones
alias ls="eza -al --group-directories-first --no-quotes"
alias vim="nvim"
alias mutt="neomutt"
alias cat="bat"

# Personal
alias jf="cd ~/notes && sh ~/.scripts/journal/load_journal.sh && sh ~/.scripts/journal/journal.sh"
alias save="sh ~/.scripts/journal/save_journal.sh"
alias wk="cd ~/notes && sh ~/.scripts/weekly/weekly.sh && cd -"
alias duck="sh ~/.scripts/duck.sh"
alias weather="curl wttr.in/turku\?MFQ"
alias mpvo="setsid -f mpv --really-quiet --no-terminal"
alias week="vdirsyncer -v WARNING sync && khal calendar today sunday"

# Gentoo
alias esy="sudo emaint --auto sync" # Sync Gentoo repos
alias eup="sudo emerge --ask --verbose --update --deep --newuse @world" # Update the system
alias ecl="sudo emerge --ask --depclean" # Cleanup after update

# tmux
alias base="sh ~/.scripts/tmux/base.sh"
alias pro="sh ~/.scripts/tmux/project.sh"

# Work
alias work="cd ~/notes && sh ~/.scripts/log/log.sh && cd -"
alias twork="sh ~/.scripts/tmux/work.sh"
alias epsilon="ssh"
alias puhti="ssh"
alias mahti="ssh"
alias lumi="ssh"
