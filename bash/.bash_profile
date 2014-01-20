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

# CHRUBY (currently unused)
source /usr/local/share/chruby/chruby.sh
export RUBIES=(
  /usr/local/opt/ruby
)

# NVM
source $(brew --prefix nvm)/nvm.sh

# RBENV USE HOMEBREW DIR INSTEAD OF ~/.rbenv
export RBENV_ROOT=/usr/local/var/rbenv

# RBENV AUTOCOMPLETE
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# EXPORTS
export PGHOST=/tmp
export EDITOR=subl

# PATH
homebrew=/usr/local/bin:/usr/local/sbin
ruby=/usr/local/opt/ruby/bin
heroku=/usr/local/heroku/bin
rbenv=$HOME/.rbenv/bin
export PATH=$homebrew:$rbenv:$ruby:$heroku:$PATH

function gc() {
  git clone git@github.com:jaketrent/$1.git
}
export PATH=$HOME/bin:$PATH
