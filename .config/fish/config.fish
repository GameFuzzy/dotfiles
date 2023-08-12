if status is-interactive
pfetch
starship init fish | source

alias dev "cd ~/Developer"
alias c "clear"
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end

function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item
abbr -a vim --position anywhere nvim

end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

# Add this to the end of your config file
zoxide init fish | source
