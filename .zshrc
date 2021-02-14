# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='vim'
#export ANTIGEN_DEBUG_LOG=/dev/stdout
# Custom functions
fpath+=~/custom-zsh-functions
autoload ~/custom-zsh-functions/*(:t)
source ~/.antigen.zsh
#source /usr/local/share/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle kubectl
antigen bundle helm
antigen bundle docker
antigen bundle tmux
antigen bundle tmuxinator
# Other bundles
antigen bundle sdkman/sdkman-cli zsh
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# Load the theme.
antigen theme romkatv/powerlevel10k
# Tell Antigen that you're done.
antigen apply
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

sdk use java 8.0.282.j9-adpt

# The following two modules (compinit and bashcompinit) are needed to get auto
# complete to work: https://github.com/ohmyzsh/ohmyzsh/issues/6323
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source /usr/local/ibmcloud/autocomplete/zsh_autocomplete

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
