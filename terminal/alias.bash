alias subl="~/bin/subl"
alias schrome="open -a com.google.chrome --args --disable-web-security"
alias b="/usr/bin/open -a '/Applications/Google Chrome.app'"

alias e="vim"
alias eca="vim ~/.mydot/terminal/alias.bash"
alias et="vim ~/.mydot/terminal/"
alias sserv="python -m SimpleHTTPServer"
alias etodo="vim ~/Dropbox/todo.txt"
# Git 
alias gs="git status"
alias ga="git add"
alias gp="git push"
alias gl="git log"

# Sencha
alias st="sencha -sdk ~/Downloads/touch-2.1.1 "
alias stg="sencha generate"
alias stgc="sencha generate controller"
alias stgv="sencha generate view"
alias stgm="sencha generate model"

#list directory contents
alias sl=ls
alias la='ls -AFv'       # Compact view, show hidden
alias ls="ls -Gav"
alias ll='ls -alv'
alias l='ls -av'
alias l1='ls -1'

alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up two directories
alias -- -='cd -'        # Go back
alias ~="cd ~"

alias cdp="cd ~/Projects"
alias cdt="cd ~/temp"
alias cddot="cd ~/.mydot"

alias f='fg'
#Shell History
alias h='history'

#Directory
alias   md='mkdir -p'
alias   rd='rmdir'

alias py='python'

alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false &&
    killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true &&
    killall Finder"

