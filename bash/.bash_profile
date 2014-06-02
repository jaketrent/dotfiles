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

# NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM

# RBENV USE HOMEBREW DIR INSTEAD OF ~/.rbenv
#export RBENV_ROOT=/usr/local/var/rbenv

# RBENV AUTOCOMPLETE
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# EXPORTS
export PGHOST=/tmp
export EDITOR=subl

# PATH
local_node=./node_modules/.bin
homebrew=/usr/local/bin:/usr/local/sbin
ruby=/usr/local/opt/ruby/bin
heroku=/usr/local/heroku/bin
rbenv=$HOME/.rbenv/bin
rvm=$HOME/.rvm/bin
export PATH=$local_node:$homebrew:$rvm:$rbenv:$ruby:$heroku:$PATH

function gc() {
  git clone git@github.com:jaketrent/$1.git
}
function ni() {
  npm install $1 --save
}
function nid() {
  npm install $1 --save-dev
}
export PATH=$HOME/bin:$PATH

eval "$(hub alias -s)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
