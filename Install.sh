#! /bin/bash
cat << "ASCII"

██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝

ASCII

printf "Select your package manager: \n"
printf "[1] Debian/Ubuntu/Mint/PopOS (APT) \n [2] Fedora/Centos/RHEL (DNF) \n"
printf "[3] Arch/Manjaro/Endeavour/Arco (Pacman) \n"
read -r -p ": " pm_choice

case $pm_choice in
    1)
        pm_install="sudo apt install -y"
        pm_listing="dpkg -l"
    ;;
    2)
        pm_install="sudo dnf install -y"
        pm_listing="dnf list installed"
    ;;
    3)
        pm_install="sudo pacman -S --noconfirm"
        pm_listing="pacman -Q"
    ;;
    *) echo "Invalid choice. Exiting..."; exit 1 ;;
esac

printf "Select which dotfiles to install: \n"
printf "[1] Hyprland | [2] Bspwm | [3] Both \n"
read -r -p ": " wm_choice

common_pkgs=(neovim kitty fish firefox dunst fastfetch tree sddm unzip ripgrep cava rofi fzf)
hyprland_pkgs=(hyprland waybar wl-clipboard)
bspwm_pkgs=(bspwm sxhkd picom polybar feh flameshot xclip)

install_verify() {
    local packages=("$@")
    for pkg in "${packages[@]}"; do
        if $pm_listing | grep -q "$pkg"; then
            echo "$pkg is installed"
        else
            echo "$pkg Is not installed. Please try installing it manually after the installation process ends."
        fi
    done
}

install_wm() {
    local wm_name=$1
    local wm_pkgs=$2

    echo "Installing $wm_name packages..."
    for pkg in "${wm_pkgs[@]}"; do
        $pm_install "$pkg"
    done
}

printf "Installing common packages... \n"
for pkg in "${common_pkgs[@]}"; do
    $pm_install "$pkg"
done
if [[ $wm_choice == 1 || $wm_choice == 3 ]]; then
    install_wm "Hyprland" hyprland_pkgs[@] &>/dev/null/
fi
if [[ $wm_choice == 2 || $wm_choice == 3 ]]; then
    install_wm "Bspwm" bspwm_pkgs[@] &>/dev/null/
fi

all_pkgs=("${common_pkgs[@]}" "${hyprland_pkgs[@]}" "${bspwm_pkgs[@]}")
install_verify "${all_pkgs[@]}"

printf "Installation process finished. \n"
printf "If a package failed to install, please install it manually after the script ends. \n"

error_msg() {
    local msg=$1
    if [[ $? -eq 0 ]]; then
        echo "$msg successfully created"
    else
        echo "Failed to create $msg."
        exit 1
    fi
}

if [ -d "$HOME/.dotfiles/" ]; then
    echo "There is already a '.dotfiles' directory in $HOME."
    printf "A new one is the best option for installing all the dotfiles \n What do you want to do? \n"
    printf "[1] Create a backup | [2] Install over it (recommended if installing a missing rice) | [3] Exit \n"
    read -r -p ": " duped_dotfiles

    case $duped_dotfiles in
        1) mv "$HOME/.dotfiles/" "$HOME/.dotfiles.bak/" && error_msg "Backup";;
        2) mv bspwm/ hyprland/ fonts/ icons/ RiceSwap.sh "$HOME/.dotfiles/" && error_msg "Directories";;
        3) echo "Aboring..."; exit 0;;
    esac
fi

echo "Creating .dotfiles directory on $HOME"
mkdir "$HOME/.dotfiles/" && error_msg "Directory"

printf "Moving Selected dotfiles... \n"
if [[ $wm_choice == 1 || $wm_choice == 3 ]]; then
    mv hyprland/ "$HOME/.dotfiles/" && error_msg "Directory"
fi
if [[ $wm_choice == 2 || $wm_choice == 3 ]]; then
    mv bspwm/ "$HOME/.dotfiles/" && error_msg "Directory"
fi

echo
printf "Installation process finished \n You should now reboot your PC"
printf "Exiting..."
exit 0
