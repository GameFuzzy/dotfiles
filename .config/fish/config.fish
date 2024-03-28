if status is-interactive
    fish_vi_key_bindings # Enable vi bindings by default
    pfetch
    starship init fish | source

    alias conf "cd ~/.config; nvim"
    alias dev "cd ~/Developer"
    abbr -a c clear
    abbr -a . "nvim ."
    alias ly 'lazygit --use-config-file "$HOME/.config/yadm/lazygit.yml,$HOME/Library/Application Support/lazygit/config.yml" --work-tree ~ --git-dir ~/.local/share/yadm/repo.git'
    abbr -a tmux-new 'tmux new -s main'

    alias nvim-old 'NVIM_APPNAME="nvim.bak" nvim'

    if type -q exa
        alias ll "exa -l -g --icons"
        alias lla "ll -a"
    end

    # C++ 
    alias mkfcpp makefile-cpp
    alias gencppdb "make clean; bear -- make; mv compile_commands.json ../"

    # Java
    alias junit-get "curl -L https://search.maven.org/remotecontent\?filepath=junit/junit/4.12/junit-4.12.jar -o junit-4.12.jar; curl -L https://search.maven.org/remotecontent\?filepath=org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar -o hamcrest-core-1.3.jar"
    alias junitc-all "javac -cp '.:hamcrest-core-1.3.jar:junit-4.12.jar' *.java"
    alias junit-run "java -cp '.:hamcrest-core-1.3.jar:junit-4.12.jar' org.junit.runner.JUnitCore"

    alias bibc "bibclean -align-equals -delete-empty-values refs.bib"

    alias mokuro-all "mokuro --parent_dir"

    set -x LC_CTYPE en_US.UTF-8

    function last_history_item
        echo $history[1]
    end
    abbr -a !! --position anywhere --function last_history_item
    abbr -a vim --position anywhere nvim

end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" hook $argv | source
end
# <<< conda initialize <<<

# Add this to the end of your config file
zoxide init fish | source
