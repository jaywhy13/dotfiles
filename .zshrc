# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation. export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"
plugins=(pip python brew macos emoji)

source $HOME/.oh-my-zsh/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"

function load_nvm {
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

function load_wave {
    # wave autocomplete setup
    WAVE_AC_ZSH_SETUP_PATH="$HOME/Library/Caches/wave/autocomplete/zsh_setup" && test -f $WAVE_AC_ZSH_SETUP_PATH && source $WAVE_AC_ZSH_SETUP_PATH;
}

# Github CLI functions
updatepr (){
    # Update the title with commit
    git log -1 --pretty=format:%s | xargs -I{} gh pr edit --title "{}" && \
    # Update the body with commit
    git log -1 | gh pr edit --body-file -
}

# Source the aliases we have
source $HOME/.aliases

# Source any files starting with .extra-xxxx.sh
for file in $(ls ~/.extra-*.sh)
do
    # echo "Sourcing extra file $file"
    source $file
done

# Created by `userpath` on 2020-06-19 21:12:52
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/go/bin"

# This fixes a problem with pgcli accessing RedShift
# Pgcli is using pyscopg3 under the hood which errors out when
# it tries to connect to RedShift with the error: psycopg.NotSupportedError: codec not available in Python: b'UNICODE'
# I don't fully understand why, but setting the client encoding for PG resolves
# the issue
# See https://github.com/psycopg/psycopg/issues/122
export PGCLIENTENCODING=utf-8

export EDITOR=nvim


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/jmwright/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
#
#
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

alias ou="okteto up"
alias od="okteto deploy"
alias vim=nvim
#
#
# sylver
export PATH=~/.sylver/bin:$PATH

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
