alias bc='bc -lq'
alias be='bundle exec'
alias c='clear'
alias gpd='git config user.email "john@photodojo.org"'
alias gdt='git difftool'
alias gs='git status | cowsay -f bong -W 120 | lolcat -p 1'
alias lh='ls -sh'
alias codereview='vim ~/Dropbox/Raizlabs/code-review-checklist.md'
alias startproject='django-admin.py startproject --template=~/projects/oss/django-twoscoops-project --extension=py,rst,html'
alias play="open -a 'Xcode' ~/.scratchpad.playground"
alias vpn="sudo openconnect -u john.watson --authgroup 2 https://bn-sslvpn.nuance.com"

# Alias git to gh if available.
if which gh &>/dev/null; then
  eval "$(gh alias -s)"
fi
