alias bc='bc -lq'
alias be='bundle exec'
alias bi='bundle install'
alias c='clear'
alias grz='git config user.email "john.watson@raizlabs.com"'
alias gdt='git difftool'
alias gs='git status | cowsay -f bong -W 120 | lolcat -p 1'
alias lh='ls -sh'
alias codereview='vim ~/Dropbox/Raizlabs/code-review-checklist.md'
alias startproject='django-admin.py startproject --template=~/projects/oss/django-twoscoops-project --extension=py,rst,html'

# Alias git to gh if available.
if which gh &>/dev/null; then
  eval "$(gh alias -s)"
fi
