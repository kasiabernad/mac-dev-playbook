#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"
## load correct version for this \$SHELL
( ( env | grep '^SHELL=' | grep -qic '/csh$' ) && ( set | grep -qc '^BASH=' ; test $? -gt 0 ) ) \
  && source $HOME/.kiex/scripts/kiex.csh \
  || source $HOME/.kiex/scripts/kiex.bash
# Yarn
export PATH="$PATH:$HOME/.yarn/bin"
