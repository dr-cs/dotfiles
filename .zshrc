# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/vcs/github.com/dr-cs/course-tools/bin:$PATH
export EDITOR='vim'

# Custom functions
# fpath+=~/custom-zsh-functions
# autoload ~/custom-zsh-functions/*(:t)

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="amuse"

# Bundles from the default repo (robbyrussell's oh-my-zsh).
plugins=(
    git
    direnv
    python
    virtualenv
    kubectl
    helm
    docker
)

# Source oh-my-zsh after all the setup above.
source ${ZSH}/oh-my-zsh.sh

# The following two modules (compinit and bashcompinit) are needed to get auto
# complete to work: https://github.com/ohmyzsh/ohmyzsh/issues/6323
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Start ssh-agent on Linux so I don't have to re-enter my pass phrase
# Thanks to https://esc.sh/blog/ssh-agent-windows10-wsl2/

if [[ `uname` == "Linux" ]]; then
  /usr/bin/keychain -q --nogui $HOME/.ssh/id_ed25519
  source $HOME/.keychain/$(hostname)-sh
fi

export PATH="$PATH:$HOME/go/bin"
export LESS="-Xr"

# https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"
