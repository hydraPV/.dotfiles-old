#! /bin/bash

# Ascii art made using https://www.asciiart.eu/text-to-ascii-art
cat << "EOF"


██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝

This is my installer script, this script will do the following

1) Install the needed packages
2) Ask for a backup if needed
3) Make and move needed directories
4) Ask you for the default rice

Although this **Should not** harm your system, execute this script under your own risk
If you want to see more in depth what does this script do, just open it with a text editor or see it on github

EOF

# Main prompt
read -p "Do you want to start the installation process? [Y/n]: " MainPrompt
# Converts minus inputs into mayus inputs
MainResponse=$(echo "$MainResponse" | tr '[:upper:]' '[:lower:]')


case "$MainPrompt" in
  y)
    # Package installation
    echo "Installing needed packages"
    echo " " 
    # Define "packages" as a variable that contains all needed packages
    packages=(bspwm sxhkd kitty fish firefox picom polybar neovim feh flameshot dunst fastfetch)
    # &>/dev/null makes the input of the command invisible
    sudo pacman -S "${packages[@]}" --noconfirm &>/dev/null

    # Packages install verification
    echo "Verifying packages installation"
    for package in "${packages[@]}"; do 
      if pacman -Q "$package" &>/dev/null; then
        echo "$package Successfully installed"
      else
        echo "$package Installation failed. Try installing it manually"
      fi
    done

    echo " "
    echo " "
    echo "Package installation done"
    echo "If a package installation failed, you should install it manually as soon as the installation script exits"  
    echo " "
    echo " "
    sleep 1

    # Checking for already existing .dotfiles directory
    if [ -d "$HOME/.dotfiles/" ]; then 
      echo "There is already a '.dotfiles' directory in ~/"
      echo "It is necessary for the installation to create a new directory"
      echo " " 

      # Loop for a valid input
      while ! [[ "$BakPrompt" =~ ^[yn]$ ]]; do
        read -p "Do you want to make a backup of your current .dotfiles directory? (change the name of the current .dotfiles to .dotfiles.bak) [Y/n]: " BakPrompt
        if ! [[ "$BakPrompt" =~ ^[yn]$ ]]; then
          echo "Invalid input. Please enter 'y' or 'n'."
        fi
      done

      # Converts any mayus input into a minus input
      BakPrompt=$(echo "$BakPrompt" | tr '[:upper:]' '[:lower]')
      
      case "$BakPrompt" in
        y)
          # backup creation
          echo " "
          echo "Creating .dotfiles.bak directory..."
          echo " "
          mv $HOME/.dotfiles/ .dotfiles.bak
          # Verifies if .dotfiles.bak exists, if so, the backup creation went good 
          if [ -d "$HOME/.dotfiles.bak" ]; then
            echo "Backup successfully created"
          else
            echo "Something went wrong creating a backup"
            echo "If this keeps happening, manually create a backup using"
            echo "mv $HOME/.dotfiles/ $HOME/.dotfiles.bak"
            echo " "
            echo "Aborting..."
            exit 0
          fi
          ;;
        n)
          echo "A new .dotfiles directory is needed for the installation"
          echo "Aborting..."
          exit 0
          ;;
        *)
          echo "Invalid input"
          echo "Enter 'y' or 'n'"
          echo "Aborting..."
          exit 1
          ;;
      esac    

    else
      echo "No already existing .dotfiles directory found"
      echo "Proceeding"
    fi

    # Create and verifies .dotfiles exists
    echo "Creating new .dotfiles directory on"
    echo "$HOME/.dotfiles/"
    mkdir $HOME/.dotfiles/
    if [ -d "$HOME/.dotfiles/" ]; then
      echo "Directory created successfully"
      echo "Moving dotfiles into $HOME/.dotfiles/..."

      # Moves and verifies if the rices are where they need to be
      mv BSPWM-Rices $HOME/.dotfiles
      if [ -d "$HOME/.dotfiles/BSPWM-Rices/MOTD" ] && [ -d "$HOME/.dotfiles/BSPWM-Rices/Nord/" ] && [ -d "$HOME/.dotfiles/BSPWM-Rices/hyperbeast" ]; then
        echo "Successfully moved rices into .dotfiles"
        echo "Proceeding"
      else
        echo "Something went wrong while moving directories"
        echo "Aborting"
        exit 1
      fi
    else
      echo "Something went wrong creating .dotfiles directory"
      echo "You should **NOT** make it manually, as it will be detected as a previously made directory and then deleted"
      echo "Aborting"
    fi

    # Asks for the rice to be started at the first reboot
    # Loop for valid input
    while ! [[ "$RicePrompt" =~ ^[1-3]$ ]]; do
      read -p "What Rice do you want to use at first? [Nord '1' MOTD '2' hyperbeast '3']: " RicePrompt
      if ! [[ "$RicePrompt" =~ ^[1-3]$ ]]; then
        echo "Invalid input. Please enter 1, 2, or 3."
      fi
    done

    case "$RicePrompt" in
      1)
        echo "Applying Nord rice..."
        echo "type your password if prompted to"
        sudo rm -rf $HOME/.config/kitty
        sudo rm -rf $HOME/.config/fish
        
        # Creates the symlink between .dotfiles/Nord and .config
        ln -s $HOME/.dotfiles/BSPWM-Rices/Nord/.config/* $HOME/.config/
        echo "Successfully created symlinks"
        echo " "
        echo "The installation process is done, you can now reboot your system and all should be applied"
        echo "(you will need to install a display manager if you do not have one already)"
        exit 0
        ;;
      2)
        echo "Applying MOTD rice..."
        echo "type your password if prompted to"
        sudo rm -rf $HOME/.config/kitty
        sudo rm -rf $HOME/.config/fish
        
        # Creates the symlink between .dotfiles/MOTD and .config
        ln -s $HOME/.dotfiles/BSPWM-Rices/MOTD/.config/* $HOME/.config/
        echo "Successfully created symlinks"
        echo " "
        echo "The installation process is done, you can now reboot your system and all should be applied"
        echo "(you will need to install a display manager if you do not have one already)"
        exit 0
        ;;
      3)
        echo "Applying Hyperbeast rice..."
        echo "type your password if prompted to"
        sudo rm -rf $HOME/.config/kitty
        sudo rm -rf $HOME/.config/fish
        
        # Creates the symlink between .dotfiles/hyperbeast and .config
        ln -s $HOME/.dotfiles/BSPWM-Rices/hyperbeast/.config/* $HOME/.config/
        echo "Successfully created symlinks"
        echo " "
        echo "The installation process is done, you can now reboot your system and all should be applied"
        echo "(you will need to install a display manager if you do not have one already)"
        exit 0
        ;;
      *)
        echo "Invalid input. Please press '1' '2' or '3'"
        echo "Aborting..."
        exit 1
        ;;
    esac
    ;;

  n)
    echo "Aborting installation..."
    exit 0
    ;;
  
  *)
    echo "Invalid input"
    echo "Enter 'y' or 'n'"
    exit 1
    ;;
  
esac
