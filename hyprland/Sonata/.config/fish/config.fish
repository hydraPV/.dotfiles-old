set -g fish_greeting ''

function fish_prompt

  # interactive user name @ host name, date/time in YYYY-mm-dd format and path

  set_color 404040; echo -n  [(prompt_pwd)] 
  set_color D9D9D9; echo -n  Hydra
  set_color E2E2E2; echo -n "     "

end

