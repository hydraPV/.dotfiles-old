#! /bin/bash

# ASCII ART CREATED USING https://www.asciiart.eu/text-to-ascii-art
echo "

    ███████████    ███                                                      
    ░░███░░░░░███  ░░░                                                       
    ░███    ░███  ████   ██████   ██████                                    
    ░██████████  ░░███  ███░░███ ███░░███                                   
    ░███░░░░░███  ░███ ░███ ░░░ ░███████                                    
    ░███    ░███  ░███ ░███  ███░███░░░                                     
    █████   █████ █████░░██████ ░░██████                                    
    ░░░░░   ░░░░░ ░░░░░  ░░░░░░   ░░░░░░                                     
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
    █████  █████ ███ █████  ██████   ████████  ████████   ██████  ████████ 
    ███░░  ░░███ ░███░░███  ░░░░░███ ░░███░░███░░███░░███ ███░░███░░███░░███
    ░░█████  ░███ ░███ ░███   ███████  ░███ ░███ ░███ ░███░███████  ░███ ░░░ 
    ░░░░███ ░░███████████   ███░░███  ░███ ░███ ░███ ░███░███░░░   ░███     
    ██████   ░░████░████   ░░████████ ░███████  ░███████ ░░██████  █████    
    ░░░░░░     ░░░░ ░░░░     ░░░░░░░░  ░███░░░   ░███░░░   ░░░░░░  ░░░░░     
                                    ░███      ░███                        
                                    █████     █████                       
                                    ░░░░░     ░░░░░                        
    Want to swap rice? (y) (n)      
    "

# ----------------- PROMPT 1 START -----------------
read -p " " response

# Mayus - minus
response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

# ----------------- if 1 START -----------------
if [[ "$response" == "y" ]]; then

  echo "What rice do you want to use?"

  echo " MOTD (1) | Hyperbeast (2) | Nord (3) / abort (c)"

  # To add a rice:
  # Type the name of the rice and the key to select it on l44
  # Copy the template in 181/209 or uncomment it and replace the data

  #       ----------------- PROMPT 2 START -----------------
  read -p " " response

  # Mayus - minus
  response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

  #       ----------------- MOTD rice -----------------
  if [[ "$response" == "1" ]]; then

    # REPLACE FOR SYMLINKS THAT YOU DONT WANT TO DELETE  \( -path "Path/to/symlink/" -o -path "Path/to/symlink" -o -path "Path/to/symlink" \)
    find $HOME/.config -type l \( -path "$HOME/.config/discord/SingletonLock" -o -path "$HOME/Hydra/.config/discord/SingletonCookie" -o -path "$HOME/Hydra/.config/discord/SingletonSocket" \) -prune -o -type l -exec rm {} +
    sleep 0.5
    echo " Symlinks succesfully removed"

    # rm -rf kitty/fish cuz these are open while the script is running and they create new config folders in ~/.config
    # this makes impossible to symlink it
    sudo rm -rf $HOME/.config/kitty
    sudo rm -rf $HOME/.config/fish

    # Set the symlink between the rice in ~/.dotfiles and ~/.config/
    ln -s ~/.dotfiles/MOTD/.config/* ~/.config/
    sleep 0.5
    echo " New symlinks succesfully created"

    # restart BSPWM
    bspc wm -r

    echo "MOTD Rice succesfully applied"
    echo "You should reboot your system to correctly apply everything"
    #       ----------------- MOTD rice -----------------

    #       ----------------- Hyperbeast rice -----------------
  elif [[ "$response" == "2" ]]; then

    # REPLACE FOR SYMLINKS THAT YOU DONT WANT TO DELETE  \( -path "Path/to/symlink/" -o -path "Path/to/symlink" -o -path "Path/to/symlink" \)
    find $HOME/.config -type l \( -path "$HOME/.config/discord/SingletonLock" -o -path "$HOME/Hydra/.config/discord/SingletonCookie" -o -path "$HOME/Hydra/.config/discord/SingletonSocket" \) -prune -o -type l -exec rm {} +
    sleep 0.5
    echo " Symlinks succesfully removed"

    # rm -rf kitty/fish cuz these are open while the script is running and they create new config folders in ~/.config
    # this makes impossible to symlink it
    sudo rm -rf $HOME/.config/kitty
    sudo rm -rf $HOME/.config/fish

    # Set the symlink between the rice in ~/.dotfiles and ~/.config/
    ln -s ~/.dotfiles/hyperbeast/.config/* ~/.config/
    sleep 0.5
    echo " New symlinks succesfully created"

    # restart BSPWM
    bspc wm -r

    echo "Hyperbeast Rice succesfully applied"
    echo "You should reboot your system to correctly apply everything"

    #       ----------------- Hyperbeast rice -----------------

    #       ----------------- Nord rice -----------------

  elif [[ "$response" == "3" ]]; then

    # Deletes all symlinks in ~/.config
    # REPLACE FOR SYMLINKS THAT YOU DONT WANT TO DELETE  \( -path "Path/to/symlink/" -o -path "Path/to/symlink" -o -path "Path/to/symlink" \)
    find $HOME/.config -type l \( -path "$HOME/.config/discord/SingletonLock" -o -path "$HOME/Hydra/.config/discord/SingletonCookie" -o -path "$HOME/Hydra/.config/discord/SingletonSocket" \) -prune -o -type l -exec rm {} +
    sleep 0.5
    echo " Symlinks succesfully removed"

    # rm -rf kitty/fish cuz these are open while the script is running and they create new config folders in ~/.config
    # this makes impossible to symlink it
    sudo rm -rf $HOME/.config/kitty
    sudo rm -rf $HOME/.config/fish

    # Set the symlink between the rice in ~/.dotfiles and ~/.config/
    ln -s ~/.dotfiles/Nord/.config/* ~/.config/
    sleep 0.5
    echo "New symlinks succesfully created"

    # restart BSPWM
    bspc wm -r

    echo "Nord Rice succesfully applied"
    echo "You should reboot your system to correctly apply everything"
    exit

    #       ----------------- Nord rice -----------------

    #       ----------------- Exit -----------------
  elif [[ "$response" == "c" ]]; then

    echo "No changes were made"
    echo "Aborting..."
    sleep 1
    exit
    #       ----------------- Exit -----------------

    #       ----------------- Wrong input -----------------
  else

    echo "Invalid input. Please press (y) for yes and (n) for no"
    echo "aborting..."
    sleep 1
    exit
    #       ----------------- Wrong input -----------------

  fi

#       ----------------- PROMPT 2 END -----------------

elif [[ "$response" == "n" ]]; then

  echo "No changes were made"
  echo "Aborting..."
  sleep 1
  exit

else

  echo "Invalid input. Please press (y) for yes and (n) for no"
  echo "aborting..."
  sleep 1
  exit

# ----------------- if 1 END -----------------

fi

# ----------------- PROMPT 1 END -----------------

#----------------- ADD RICE TEMPLATE -----------------

#       elif [[ "$response" == "x" ]]; then
#
# Deletes all symlinks in ~/.config
# REPLACE FOR SYMLINKS THAT YOU DONT WANT TO DELETE  \( -path "Path/to/symlink/" -o -path "Path/to/symlink" -o -path "Path/to/symlink" \)
#           find $HOME/.config -type l \( -path "Path/to/symlink/" -o -path "Path/to/symlink/" -o -path "Path/to/symlink/" \) -prune -o -type l -exec rm {} +
#           sleep 0.5
#           echo " Symlinks succesfully removed"
#
#
# rm -rf kitty/fish cuz these are open while the script is running and they create new config folders in ~/.config
# this makes impossible to symlink it
#           sudo rm -rf $HOME/.config/kitty
#           sudo rm -rf $HOME/.config/fish
#
#
# Set the symlink between the rice in ~/.dotfiles and ~/.config/
#           ln -s ~/.dotfiles/RICE-NAME/.config/* ~/.config/
#           sleep 0.5
#           echo " New symlinks succesfully created"
#
# restart BSPWM
#           bspc wm -r
#
#           echo "X rice succesfully installed"
#           echo "You should reboot your system to correctly apply everything"
#----------------- ADD RICE TEMPLATE -----------------