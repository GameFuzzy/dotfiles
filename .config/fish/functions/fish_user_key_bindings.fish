function fish_user_key_bindings
  # vim-like
  bind \cl forward-char

  # prevent iterm2 from closing when typing Ctrl-D (EOF)
  bind \cd delete-char
end

function fzf_common_cd
  begin
    echo $HOME/.config
    ghq list --full-path
  end | fzf | read dir 
builtin cd $dir
end

bind \cf fzf_common_cd

fzf_configure_bindings --directory=\co
