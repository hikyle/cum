[[ $- != *i* ]] && return

alias c='clear'
alias ff='fastfetch'
alias ls='eza -a --icons=always'
alias ll='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'
alias grep='grep --color=always'
alias cleanup='sudo pacman -Runs $(pacman -Qdtq)'
alias updatemirrors='sudo reflector --sort rate --country US --latest 10 --protocol https --save /etc/pacman.d/mirrorlist'
alias ..='cd ..'
alias ...='cd ../..'
alias cat='bat'

if [[ $(tty) == *"pts"* ]]; then
	fastfetch
fi

PS1="\[\e[38;5;75m\]\u@\h \[\e[38;5;113m\]\w \[\e[38;5;189m\]\$ \[\e[0m\]"
