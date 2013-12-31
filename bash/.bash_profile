# put computer user@hostname and cwd in terminal prompt
#export PS1="\u@\h \w > \[\e[0m\]"

# Load the dotfiles
for file in ~/.{bash_prompt,git-completion,aliases,secrets}; do
    [ -r "$file" ] && source "$file"
done
unset file

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

. ~/.nvm/nvm.sh

export PGHOST=/tmp

export EDITOR=subl

alias pgs='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgq='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias git=hub

#export PATH=$HOME/Library/Python/2.7/bin:/usr/local/bin:$GOPATH/bin:$HOME/.nvm/v0.8.2/bin:$HOME/dev/bin:$PATH


