# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$HOME/.dotfiles/misc/oh-my-zsh-custom

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Hide username in prompt
DEFAULT_USER=`whoami`

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git laravel4 laravel5 composer macos)

source $ZSH/oh-my-zsh.sh

export PATH=Users/$DEFAULT_USER/.rvm/gems/ruby-2.1.2/bin:$PATH


# Load the shell dotfiles, and then some:
# * ~/.dotfiles-custom can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/shell/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

for file in ~/.dotfiles-custom/shell/.{exports,aliases,functions,zshrc}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Load rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH="$PATH:$HOME/.rvm/bin"
. $HOME/.dotfiles/shell/z.sh

# Alias hub to git
eval "$(hub alias -s)"

# Sudoless npm https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export PATH=$HOME/.dotfiles/bin:$PATH

# Enable zsh-autosuggestions
source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Import ssh keys in keychain
ssh-add -A 2>/dev/null;

# Enable thefuck
eval $(thefuck --alias)

# Extra paths
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH=/usr/local/bin:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"
alias a='php artisan'
alias va='valet php artisan'