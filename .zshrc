# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"
plugins=(pip python brew osx emoji)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"

function load_nvm {
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

function load_wave {
    # wave autocomplete setup
    WAVE_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/wave/autocomplete/zsh_setup" && test -f $WAVE_AC_ZSH_SETUP_PATH && source $WAVE_AC_ZSH_SETUP_PATH;
}

# Source the aliases we have
source ./.aliases

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc


# Add thesaurus to $PATH
# export PATH=$HOME/code/command-line-thesaurus:$PATH

# Created by `userpath` on 2020-06-19 21:12:52
export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/go/bin"

# Setup z
# source /usr/local/etc/profile.d/z.sh

# Configure colorize
ZSH_COLORIZE_STYLE="monokai"

# Install Git SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

