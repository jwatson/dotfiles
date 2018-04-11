###
### Wrap a git command or show the current status.
###
compdef g=git
function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --short --branch
  fi
}

###
### General aliases, alphabetized.
###

alias ga='git add'
alias gaa='git add -a'

alias gb='git branch'

alias gc!='git commit -v --amend'
alias gc='git commit -v'
alias gca!='git commit -v -a --amend'
alias gca='git commit -v -a'
alias gcb='git checkout -b'
alias gclean='git clean -fd'
alias gco='git checkout'
alias gcp='git cherry-pick'

alias gd='git diff'
alias gdt='git difftool'

alias glg='git log --stat'

alias gst='git status'

###
### Very specific aliases, logically ordered.
###

## Set my email address.
alias gpersonal='git config user.email "john@photodojo.org"'
alias gwork='git config user.email "john.watson@nuance.com"'

## List all ignored files.
alias gignored='git ls-files --others --ignored --exclude-standard'

## Apply/remove work-in-progress commits.
alias gwip="git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m \"– WIP –\""
alias gunwip='git log -n 1 | grep -q -c "– WIP –" && git reset HEAD~1'
