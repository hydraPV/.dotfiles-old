set -U fish_prompt_pwd_dir_length 4

function fish_prompt

  echo " "
  set_color 81A1C1; echo "["(date "+%H:%M")"]---> "(prompt_pwd)
  set_color a3be8c; echo  "  Hydra  "

end
