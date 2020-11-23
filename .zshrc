# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fuzzy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
neofetch

wal -i $HOME/Pictures/background.jpg -q

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9k_OS_ICON=$'\uF303'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context status dir vcs) POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

plugins=(git)

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
