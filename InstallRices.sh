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
echo "If you already have a .dotfiles directory, you will be asked later if you want to automatically do a backup"
echo "This probably WONT harm your system, but in any way, are you 100% sure that you want to do this process?"
echo " "
echo "yes (y)"
echo "no (n)"

# This is the main prompt
read -p " " MainResponse 

# Converts mayus inputs to minus inputs
MainResponse=$(echo "$MainResponse" | tr '[:upper:]' '[:lower:]')

# If MainResponse answer is yes
if [[ "$MainResponse" == "y" ]]; then

  # Package installation process

  # Install packages
  echo "Installing packages..."

  # Variable packages equals to all the needed packages
  packages=(bspwm sxhkd kitty fish firefox picom polybar neovim feh flameshot dunst fastfetch )
  
  # Install the packages
  sudo pacman -S "${packages[@]}" --noconfirm &>/dev/null
  echo "Done installing packages"

  # Verify if packages where correctly installed
  echo "Verifying packages installation..."
  for package in "${packages[@]}"; do

  if pacman -Q "$package" &>/dev/null; then

      echo "$package Correctly installed"
    
  else

      echo "$package Is not installed, try installing it manually later with pacman -S $package"
      echo " "
      echo "Aborting..."
      sleep 1 
      exit

  fi
  done

  # Packages installation process done

  # .dotfiles Backup process

  # Checks if .dotfiles directory already exist and ask if want to do a backup
  if [ -d "$HOME/.dotfiles/" ]; then
    
    # If .dotfiles already exists, asks if want to automatically do a backup
    echo " " 

    echo "There is already a .dotfiles directory in your system, would you like to automatically do a backup of your current .dotfiles directory?"
    echo " "
    echo "yes (y)"
    echo "no (n)  (This will exit the installation process and undo any change made)"
   
    # This is the .dotfiles backup response
    read -p " " BakResponse

    # Converts mayus inputs to minus inputs
    BakResponse=$(echo "$BakResponse" | tr '[:upper:]' '[:lower:]')

    # If BakResponse answer is yes
    if [[ "$BakResponse" == "y" ]]; then
      
      # Do a backup of the current .dotfiles directory
      mv $HOME/.dotfiles .dotfiles.bak
      
      # Checks if the backup is correctly renamed
      if [ -d $HOME/.dotfiles.bak ]; then
      
        echo ".dotfiles.bak was succesfully created"

      else

        echo ".dotfiles backup directory creation failed, do you want to exit the installation process?"
        echo " "
        echo "yes (y)"
        echo "no (n)"
        
        # This is the abort response
        read -p " " AbortResponse

        # Converts mayus inputs to minus inputs
        AbortResponse=$(echo "$AbortResponse" | tr '[:upper:]' '[:lower:]')

        # If BakResponse answer is yes
        if [[ "$AbortResponse" == "y" ]]; then

          echo "Aborting..."
              
          # Packages uninstall process

          # Asks if want to uninstall packages
          echo "Do you want to uninstall the previously installed packages?"
          echo "yes (y)"
          echo "no (n)"

          # This is the packages-uninstall response
          read -p " " PackageUninstallResponse
          
          # Converts mayus inputs to minus inputs
          PackageUninstallResponse=$(echo "PackageUninstallResponse" | tr '[:upper:]' '[:lower:]')
              
          # If PackageUninstallResponse answer is yes
          if [[ "$PackageUninstallResponse" == "y" ]]; then
            
            # Package unninstall process

            for package in "${packages[@]}"; do

            # Uninstall packages
            sudo pacman -Rns "$package" &>/dev/null

              # Check if the package is still installed
              if pacman -Q "$package" &>/dev/null; then

                # Package uninstallation failed
                echo "$package uninstallation failed. Try uninstalling it manually with: sudo pacman -Rns $package"

                else

                  # Package uninstallation successful
                  echo "$package uninstallation successful."
                  sleep 1 
                  exit

              fi
            done

            # Packages uninstall process done
            
          elif [[ "$PackageUninstallResponse" == "n" ]]; then

            echo "No packages will be removed"
            echo "Aborting..."
            sleep 1
            exit
          
          else

            echo "Invalid input, please enter (y) for yes and (n) for no"
            echo "Aborting"
            sleep 1 
            exit
          
          fi 
        fi  
      fi 
    
    else

      echo "The installation process cannot be done if there is already a .dotfiles directory"
      echo "Aborting..."
      sleep 1

      # Packages uninstall process

      # Asks if want to uninstall packages
      echo "Do you want to uninstall the previously installed packages?"
      echo "yes (y)"
      echo "no (n)"

      # This is the packages-uninstall response
      read -p " " PackageUninstallResponse2
      
      # Converts mayus inputs to minus inputs
      response=packages-uninstall2=$(echo "PackageUninstallResponse2" | tr '[:upper:]' '[:lower:]')
          
      # If PackageUninstallResponse answer is yes
      if [[ "$PackageUninstallResponse2" == "y" ]]; then
        
        # Package unninstall process

        for package in "${packages[@]}"; do

          # Uninstall packages
          sudo pacman -Rns "$package" &>/dev/null

          # Check if the package is still installed
          if pacman -Q "$package" &>/dev/null; then

            # Package uninstallation failed
            echo "$package uninstallation failed. Try uninstalling it manually with: sudo pacman -Rns $package"

            else

              # Package uninstallation successful
              echo "$package uninstallation successful."
              sleep 1 
              exit

          fi
        done

        # Packages uninstall process done
        
      elif [[ "$PackageUninstallResponse2" == "n" ]]; then

        echo "No packages will be removed"
        echo "Aborting..."
        sleep 1
        exit
      
      else

        echo "Invalid input, please enter (y) for yes and (n) for no"
        echo "Aborting"
        sleep 1 
        exit
      
      fi 
    fi   
  fi
  
  else

    echo "There is no .dotfiles directory"
    sleep 0.5

  fi
  
  # Create directories
  echo "Creating directories..."
  mkdir $HOME/.dotfiles/
  mv MOTD/ Nord/ hyperbeast/ $HOME/.dotfiles/

  # Checks if created directories exist
  if [ -d "$HOME/.dotfiles/MOTD/" ] && [ -d "$HOME/.dotfiles/Nord/" ] && [ -d "$HOME/.dotfiles/hyperbeast/" ]; then

    echo "Done creating directories..."
  
  else

    # Directory creating process failed
    echo "Something went wrong creating directories"
    echo "Aborting..."
    sleep 1
    exit

  fi

  # Asks for the default rice
  echo "What rice do you want to apply at first?"
  echo "MOTD (1) Nord (2) Hyperbeast (3)"
  read -p " " RiceResponse
  
  if [[ "$RiceResponse" == "1" ]]; then
    
    # Create symlinks
    echo "Creating symlinks..."
    ln -s $HOME/.dotfiles/MOTD/.config/* $HOME/.config/
    sleep 0.3
    echo "Done creating symlinks"

    echo "Installation ready, please reboot your system"
    exit

  elif [[ "$RiceResponse" == "2" ]]; then
    
    # Create symlinks
    echo "Creating symlinks..."
    ln -s $HOME/.dotfiles/Nord/.config/* $HOME/.config/
    sleep 0.3
    echo "Done creating symlinks"

    echo "Installation ready, please reboot your system"
    exit

  elif [[ "$RiceResponse" == "3" ]]; then
    
    # Create symlinks
    echo "Creating symlinks..."
    ln -s $HOME/.dotfiles/hyperbeast/.config/* $HOME/.config/
    sleep 0.3
    echo "Done creating symlinks"

    echo "Installation ready, please reboot your system"
    exit
  
  else
    
    # Invalid input message
    echo "Invalid input. Please press (1) for MOTD, (2) for Nord and (3) for hyperbeast"
    echo "Aborting..."
    sleep 1
    exit
    
  fi

elif [[ "$MainResponse" == "n" ]]; then
  
  echo "No changes were made"
  echo "Aborting..."
  sleep 1
  exit

else 

  # Invalid input message
  echo "Invalid input. Please press (y) for yes and (n) for no"
  echo "Aborting..."
  sleep 1
  exit

fi 
