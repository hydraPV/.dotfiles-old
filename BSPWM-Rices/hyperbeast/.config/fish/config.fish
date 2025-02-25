set -g fish_greeting ''

function fish_prompt

  # interactive user name @ host name, date/time in YYYY-mm-dd format and path

  set_color C9498E; echo -n  [(prompt_pwd)] 
  set_color 6fff00; echo -n  Hydra
  set_color 30A57C; echo -n "     "

end

