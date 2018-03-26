# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# auth
brew cask install dropbox
brew cask install keepassxc

# ssh 
ssh-keygen -t rsa -b 4096 -C "trent.jake@gmail.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

# github ssh
cat ~/.ssh/id_rsa.pub | pbcopy
open https://github.com/settings/keys

# TODO: pause

# dotfiles
mkdir -p ~/dev
cd ~/dev && git clone git@github.com:jaketrent/dotfiles.git

# terminal
brew install iterm
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cd ~/ && ln -s ~/dev/dotfiles/bash/.aliases
cd ~/ && ln -s ~/dev/dotfiles/bash/.bash_profile
cd ~/ && ln -s ~/dev/dotfiles/bash/.zshenv
cd ~/ && ln -s ~/dev/dotfiles/bash/.zshrc
cd ~/ && ln -s ~/dev/dotfiles/git/.git-completion
cd ~/ && ln -s ~/dev/dotfiles/git/.gitconfig
cd ~/ && ln -s ~/dev/dotfiles/git/.gitexcludes
cd ~/ && ln -s ~/dev/dotfiles/git/.gitignore

# browsers
brew cask install google-chrome
brew tap caskroom/versions
brew cask install firefox-developer-edition

# keyboard
cd ~/Downloads && curl -O https://github.com/ckb-next/ckb-next/releases/download/v0.2.9/ckb-v0.2.9_macOS-10.10.pkg
cd ~/Downloads && open ckb-v0.2.9_macOS-10.10.pkg

# nvm/node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source ~/.bash_profile
source ~/.zshenv
nvm install 9.5.0

# editor
brew tap d12frosted/emacs-plus
brew install emacs-plus --HEAD --with-natural-title-bars
brew link emacs-plus
cd ~/ && ln -s ~/dev/dotfiles/emac/.spacemacs
cd ~/ && git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cd ~/.emacs.d/private && git clone git@github.com:praveenperera/spacemacs-prettier.git
cd ~/dev && git clone git@github.com:ternjs/tern.git
cd ~/dev/tern && npm install

# fonts
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Black%20for%20Powerline.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Bold%20for%20Powerline.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20ExtraLight%20for%20Powerline.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Light%20for%20Powerline.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Medium%20for%20Powerline.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Powerline%20BlackItalic.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Powerline%20BoldItalic.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Powerline%20ExtraLightItalic.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Powerline%20Italic.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Powerline%20LightItalic.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Powerline%20MediumItalic.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Powerline%20SemiboldItalic.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20Semibold%20for%20Powerline.otf
cd ~/Downloads && curl -O https://github.com/powerline/fonts/raw/master/SourceCodePro/Source%20Code%20Pro%20for%20Powerline.otf
open /Applications/Font\ Book.app

## TODO: pause

# tmux
brew install tmux
cd ~/ && ln -s ~/dev/dotfiles/git/.gitignore

# misc
brew install hub
brew cask install bartender
