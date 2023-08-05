if status is-interactive
pfetch
starship init fish | source
end

alias vim "nvim"
alias dev "cd ~/Developer"

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
  alias cl "clear"
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

# Add this to the end of your config file
zoxide init fish | source
