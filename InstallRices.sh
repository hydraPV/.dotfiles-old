#! /bin/sh

# Ascii art made using https://www.asciiart.eu/text-to-ascii-art
echo "

██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝

"

# Asks if want to install the rices
echo "This is the installer, this script will create the dotfiles directory and set up"
echo "everything in there, this will create symlinks between ~/.config and ~/.dotfiles"
echo "This probably WONT harm your system, but in any way, are you 100% sure that you want to do this process?"
echo "yes (y)"
echo "no (n)"
read -p " " response 

# Converts mayus inputs to minus inputs
response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

if [[ "$response" == "y" ]]; then

  # Install packages
  echo "Installing packages..."
  # Variable packages equals to all the needed packages
  packages = (bspwm sxhkd kitty fish firefox picom polybar neovim feh flameshot dunst fastfetch cava)
  sleep 0.5
  sudo pacman -S "$packages" --noconfirm
  echo "Done installing packages"

  # Create directories
  echo "Creating directories..."
  mkdir $HOME/.dotfiles/
  mv MOTD/ Nord/ hyperbeast/ $HOME/.dotfiles/

  # Checks if everything went good
  if [ -d "$HOME/.dotfiles/MOTD/"] then;

    echo "Done creating directories..."
  
  else

    echo "Something went wrong"
    echo "Aborting..."
    sleep 1
    exit

  fi

# Asks for the default rice
  echo "What rice do you want to apply at first?"
  echo "MOTD (1) Nord (2) Hyperbeast (3)"
  read -p " "
  
  if [[ "$response" == "1" ]]; then
    
    echo "Creating symlinks..."
    ln -s $HOME/.dotfiles/MOTD/.config/* $HOME/.config/
    sleep 0.3
    echo "Done creating symlinks"

    echo "Installation ready, please reboot your system"

  elif [[ "$response" == "2" ]]; then
    
    echo "Creating symlinks..."
    ln -s $HOME/.dotfiles/Nord/.config/* $HOME/.config/
    sleep 0.3
    echo "Done creating symlinks"

    echo "Installation ready, please reboot your system"

  elif [[ "$response" == "3" ]]; then
    
    echo "Creating symlinks..."
    ln -s $HOME/.dotfiles/hyperbeast/.config/* $HOME/.config/
    sleep 0.3
    echo "Done creating symlinks"

    echo "Installation ready, please reboot your system"
  
  else
  
    echo "Invalid input. Please press (1) for MOTD, (2) for Nord and (3) for hyperbeast
    echo "Aborting..."
    sleep 1
    exit
    
  fi

elif [[ "$response" == "n" ]]; then
  
  echo "No changes were made"
  echo "Aborting..."
  sleep 1
  exit

else 

  echo "Invalid input. Please press (y) for yes and (n) for no"
  echo "Aborting..."
  sleep 1
  exit

fi  
