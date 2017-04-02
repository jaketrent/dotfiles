# TERMINAL PROMPT
export PS1="\u@\h \w > \[\e[0m\]"

# DOTFILES
for file in ~/.{bash_prompt,git-completion,aliases,secrets}; do
    [ -r "$file" ] && source "$file"
done
unset file

# BREW
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi


# RBENV USE HOMEBREW DIR INSTEAD OF ~/.rbenv
#export RBENV_ROOT=/usr/local/var/rbenv

# RBENV AUTOCOMPLETE
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# EXPORTS
export PGHOST=/tmp
export EDITOR=vim
export GOPATH=$HOME/go
export ELM_HOME=$(brew --prefix nvm)/$(node -v)/lib/node_modules/elm/share


# PATH
local_node=./node_modules/.bin
homebrew=/usr/local/bin:/usr/local/sbin
#ruby=/usr/local/opt/ruby/bin
ruby=/Users/jtrent/.rvm/gems/ruby-2.1.5/bin
heroku=/usr/local/heroku/bin
rbenv=$HOME/.rbenv/bin
rvm=$HOME/.rvm/bin
#java=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin
java=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
gopath=$GOPATH/bin
go=/usr/local/go/bin
pg=/Applications/Postgres.app/Contents/Versions/latest/bin
nvm=~/.nvm
devbin=~/dev/bin
psql=/Applications/Postgres.app/Contents/Versions/latest/bin
tern=~/dev/tern/bin

export PATH=$local_node:$homebrew:$rvm:$rbenv:$ruby:$heroku:$java:$gopath:$go:$pg:$nvm:$devbin:$psql:$tern:$PATH
export RUBYMINE_JDK=/usr/bin/java

export PATH=$HOME/bin:$PATH

eval "$(hub alias -s)"


# attempted pip fix
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
ARCHFLAGS="-Wno-error=unused-command-line-argument-hard-error-in-future"

# NVM
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh
