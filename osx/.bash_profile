# put computer user@hostname and cwd in terminal prompt
#export PS1="\u@\h \w > \[\e[0m\]"

if [ "$PS1" ]; then
  . ~/.bash_prompt
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

. ~/.nvm/nvm.sh

export cm_api_key="xemh5tngawup";
export cm_api_secret="KHYIHaOdeM0kWPNC";
export cm_user_token="673b3712-5922-48a6-a195-d5951212ad88";
export cm_user_secret="70701799-3299-46ef-80e4-91a13879ff75";

export PATH=/usr/local/bin:$PATH
export PGHOST=/tmp

alias pgs='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgq='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
