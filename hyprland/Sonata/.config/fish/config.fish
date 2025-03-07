set -g fish_greeting ''

function fish_prompt

    set_color 89c1f5; echo -n [(prompt_pwd)]
    set_color 404040; echo -n " - "
    set_color 61b0ff; echo -n " > "
end