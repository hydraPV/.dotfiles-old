set -g fish_greeting ''
set -U fish_prompt_pwd_dir_length 4
function fish_prompt
    echo " "
    set_color 7ba7c2; echo " 󰉓  "(prompt_pwd)  
    set_color d0e3ea; echo -n " Hydra "
end