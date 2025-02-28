#! /bin/bash

# Verifies if the terminal is using a Nerd Font
check_nerd_font() { echo -e "" > /dev/null 2>&1 || { echo "Nerd Font not detected. Use a compatible Nerd Font."; exit 1; }; }
check_nerd_font

# Ascii art made using https://www.asciiart.eu/text-to-ascii-art
cat << "ASCII"

██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝

ASCII

# Brief description of what this script does
echo "This script will:"
echo "1) Ask for your distribution"
echo "2) Install the needed packages"
echo "3) Ask to create a backup (if needed)"
echo "4) Install dotfiles"
echo "5) Create symlinks"
echo " "
echo -e "Although this script \033[1mshould not\033[0m harm your system, use it at your own risk."
echo " "
echo " "
sleep 5

# Distribution selection
echo "Please select your distribution and your package manager: "
echo -e "[1]  Debian/ Ubuntu/󰣭 Mint/ PopOS (\033[1mAPT\033[0m)"
echo -e "[2]  Fedora/ Centos/ RHEL (\033[1mDNF\033[0m)"
echo -e "[3] 󰣇 Arch/ Manjaro/ Endeavour/ ArcoLinux (\033[1mPacman\033[0m)"
echo -e "[4]  openSUSE (\033[1mZypper\033[0m)"
echo "[5] Exit"
echo " "
echo " "

# Capture the input of the distribution selection
while :; do
    echo "Enter your choice [1-5]: "
    read -r -p "󱞩 " DistroPrompt
    [[ "$DistroPrompt" =~ ^[1-5]$ ]] && break
    echo " Please enter [1-5]."
done


# Define "packages" as an array containing all needed packages
packages=(bspwm sxhkd kitty fish firefox picom polybar neovim feh flameshot dunst fastfetch)

# Function to install and verify packages
install_packages() {
    local manager=$1
    local install=$2
    local listing=$3
    echo "Installing packages using $manager..."
    $install "${packages[@]}" &>/dev/null

    # Check if packages were correctly installed
    for package in "${packages[@]}"; do
        if $listing | grep -q "$package"; then
            echo " $package"
        else
            echo " $package. Please try installing it manually after the installation process ends."
        fi
    done

    echo "Package installation process finished."
    echo " "
}

# Package installation process based on distribution choice
case "$DistroPrompt" in
    1) # APT Package installation
        install_packages "APT" "sudo apt-get install" "dpkg -l" 
        ;;
    2) # DNF Package installation
        install_packages "DNF" "sudo dnf install" "dnf list installed" 
        ;;
    3) # Pacman package installation
        install_packages "Pacman" "sudo pacman -S" "pacman -Q" 
        ;;
    4) # Zypper package installation
        install_packages "Zypper" "sudo zypper install" "zypper search -i"
        ;;
    5) # Exit installation process
        echo "Aborting..."
        sleep 1
        exit 1
        ;;
esac

# Check for an existing .dotfiles directory on $HOME
if [ -d "$HOME/.dotfiles/" ]; then 

    echo -e "There is a '\033[1m.dotfiles\033[0m' directory in your home directory."
    echo "A new directory is required for the installation to proceed."
    echo " " 

    while :; do
    echo "Do you want to make a backup of your current .dotfiles directory? [Y/n]"
    read -r -p "󱞩 " BakPrompt
    BakPrompt=$(echo "$BakPrompt" | tr '[:upper:]' '[:lower:]')
    [[ "$BakPrompt" =~ ^(y|n|)$ ]] && break
    echo " Please enter [Y/n]."
    done

    # Converts any uppercase input into lowercase
    BakPrompt=$(echo "$BakPrompt" | tr '[:upper:]' '[:lower:]')

    case "$BakPrompt" in
        y)
            # Backup creation
            echo " "
            echo " "
            echo "Creating .dotfiles.bak directory..."
            echo " "
            mv "$HOME/.dotfiles" "$HOME/.dotfiles.bak"

            # Check the backup process 
            if [ -d "$HOME/.dotfiles.bak" ]; then

                echo " Backup successfully created"

            else

                echo " Something went wrong creating a backup. Please try creating it manually."
                echo " "
                echo "Aborting..."
                sleep 1
                exit 1

            fi
        ;;

        n)
            echo "A new .dotfiles directory is needed for the installation"
            echo "Aborting..."
            exit 1
        ;;
    esac
fi

# Dotfiles setup
echo "creating directory..."
mkdir "$HOME/.dotfiles" && { echo " Directory created."; } || { echo " Failed to create directory."; exit 1; }

echo "Moving dotfiles..."
mv bspwm hyprland "$HOME/.dotfiles" && { echo " Directories moved."; } || { echo " Failed to move directories."; exit 1; }

echo "Installation process completed, manually install packages if the automatic installation failed, then use the swap.sh script to apply a rice"
