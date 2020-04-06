# NVM
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

# EXPORTS
export PGHOST=/tmp
export EDITOR=vim
export GOPATH=$HOME/go
# export GOBIN=/usr/local/go/bin
export GOBIN=$GOPATH/bin
export ELM_HOME=/usr/local/opt/nvm/$(node -v)/lib/node_modules/elm/share
# export ELM_HOME=$(brew --prefix nvm)/$(node -v)/lib/node_modules/elm/share

# PATH
local_node=./node_modules/.bin
homebrew=/usr/local/bin:/usr/local/sbin
heroku=/usr/local/heroku/bin
#java=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin
java=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
gopathbin=$GOPATH/bin
gobin=$GOBIN
pg=/Applications/Postgres.app/Contents/Versions/latest/bin
nvm=~/.nvm
devbin=~/dev/bin
psql=/Applications/Postgres.app/Contents/Versions/latest/bin
tern=~/dev/tern/bin
cargo=~/.cargo/env
homebin=~/bin
python=~/Library/Python/2.7/bin

export PATH=$homebin:$local_node:$homebrew::$heroku:$java:$gopathbin:$gobin:$pg:$nvm:$devbin:$psql:$tern:$cargo:$python:$PATH
export RUBYMINE_JDK=/usr/bin/java

# support emacs terminal launching correctly
export ALTERNATE_EDITOR=""
