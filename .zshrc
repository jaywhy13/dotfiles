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

# My aliases
alias ws='wave app:start'
alias wep='wave app:exec python manage.py shell_plus'
alias we='wave app:exec'
alias wew='wave app:exec --service web python manage.py shell_plus'
alias cs='code-shell .'

# Convox aliases
export current_folder=${PWD##*/}
alias cps='convox ps --rack scylla'
# alias ce='convox exec  python manage.py shell_plus --rack scylla'
# alias cesh='convox exec  sh --rack scylla'
function ce {
    rack=$(echo "scylla\nkraken\ncetus" | fzf)
    pid_and_process=$(convox ps --rack $rack | cut -d ' ' -f1,3 | sed "1,1d" | fzf)
    pid=$(echo $pid_and_process | cut -d ' ' -f1)
    process=$(echo $pid_and_process | cut -d ' ' -f2)
    command=$(echo "python manage.py shell_plus\nsh" | fzf)
    echo "Running convox exec --rack $rack $pid $command"
    convox exec --rack $rack $pid $command
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc

# Git aliases
alias glp="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --patch"
# Update master
alias gum='git fetch origin master:master'
# Update master and rebase
alias gur='git fetch origin master:master && git rebase master'
# Interactive rebase
alias gri='git rebase -i master'


# Lazygit Alias
alias lg=lazygit

# Alias for activate environs
alias act='pyenv activate $(ls $HOME/.pyenv/versions | fzf)'

# Alias for redshift via pgcli
alias rs='pgcli -D redshift'

# Add thesaurus to $PATH
# export PATH=$HOME/code/command-line-thesaurus:$PATH


# Created by `userpath` on 2020-06-19 21:12:52
export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/go/bin"

# Configure colorize
ZSH_COLORIZE_STYLE="monokai"

# Install Git SCM Breeze
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

alias pr='gh pr checkout $(gh pr list | fzf | cut -f1)'
