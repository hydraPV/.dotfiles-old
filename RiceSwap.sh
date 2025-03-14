#!/bin/bash

# Verifies if the terminal is using a Nerd Font
check_nerd_font() {
  echo -e "" >/dev/null 2>&1 || {
    echo " Nerd Font not detected. Please use a terminal with Nerd Fonts"
    echo " Aborting"
    exit 1
  }
}
check_nerd_font

# ASCII Art
cat <<ASCII

██████╗ ██╗ ██████╗███████╗                              
██╔══██╗██║██╔════╝██╔════╝                               
██████╔╝██║██║     █████╗                                 
██╔══██╗██║██║     ██╔══╝                                 
██║  ██║██║╚██████╗███████╗                               
╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝                               
                                                          
███████╗██╗    ██╗ █████╗ ██████╗ ██████╗ ███████╗██████╗ 
██╔════╝██║    ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
███████╗██║ █╗ ██║███████║██████╔╝██████╔╝█████╗  ██████╔╝
╚════██║██║███╗██║██╔══██║██╔═══╝ ██╔═══╝ ██╔══╝  ██╔══██╗
███████║╚███╔███╔╝██║  ██║██║     ██║     ███████╗██║  ██║
╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝     ╚═╝     ╚══════╝╚═╝  ╚═╝ 

ASCII

# General Symlink function
Symlinks() {
  SOURCE="$1"
  TARGET="$2"
  REPEAT="$HOME/.config/kitty $HOME/.config/fish"

  # Verifies the variable directories
  echo " "
  echo " $SOURCE"
  echo " $TARGET"
  echo " "

  sleep 0.5

  # Remove all symlinks directories in ~/.config/
  echo "󱄀 Removing symlinks (subdirectories safe)"
  find "$TARGET" -maxdepth 1 -type l -delete
  rm -r "$REPEAT" &>/dev/null
  echo " "

  # Create symlinks in base of the selected Rice
  echo "󱄀 Creating Symlinks between $SOURCE and $TARGET"
  ln -s "$SOURCE"/* "$TARGET"
  echo " "

  sleep 0.5

  # Checks if symlinks were correctly created
  echo "󱉶 Verifying symlinks in $TARGET"
  for file in "$SOURCE"/*; do
    basefile=$(basename "$file")
    if [ -L "$TARGET/$basefile" ]; then
      echo " $basefile"
    else
      echo " $basefile Please do this symlink manually later"
    fi
  done

  sleep 1
  echo " "
  echo " "
  echo "  Swap complete."
  echo "If the WM didn't change, press Ctrl+C."
  echo "If it did, wait to be logged out."
  echo "At the SDDM screen, select the correct WM."
  sleep 10
  for i in {10..1}; do
    echo "$i"
    sleep 1
  done

  sudo systemctl restart sddm

}

# Prompt for window manager choice
while true; do
  echo -e "Use  \033[1mBSPWM\033[0m [B] /\033[1m  Hyprland [H]\033[0m | Exit [E]"
  read -r -p "󱞩 " WMPrompt
  echo " "
  WMPrompt="${WMPrompt,,}"
  [[ "$WMPrompt" =~ ^(b|h|e|)$ ]] && break
  echo " Please enter [B/H]."
done

case "$WMPrompt" in
b)
  echo "Select a BSPWM Rice"
  while true; do
    echo -e "\033[1mMOTD\033[0m [M] / \033[1mNord\033[0m [N]"
    read -r -p "󱞩 " BspwmPrompt
    echo " "
    BspwmPrompt="${BspwmPrompt,,}"
    [[ "$BspwmPrompt" =~ ^(m|n|)$ ]] && break
    echo " Please enter [M/N]."
  done

  case "$BspwmPrompt" in
  m) Symlinks "$HOME/.dotfiles/bspwm/MOTD/.config/" "$HOME/.config/" ;;
  n) Symlinks "$HOME/.dotfiles/bspwm/Nord/.config/" "$HOME/.config/" ;;
  esac

  bspc wm -r
  sleep 3
  exit
  ;;

h)
  echo "Select a Hyprland Rice"
  while true; do
    echo -e "\033[1mSonata\033[0m [S] / \033[1mGruvbox\033[0m [G] (yes very original) "
    read -r -p "󱞩 " HyprPrompt
    echo " "
    HyprPrompt="${HyprPrompt,,}"
    [[ "$HyprPrompt" =~ ^(s|g|)$ ]] && break
    echo " Please enter [S] or [G]."
  done

  case "$HyprPrompt" in
  s) Symlinks "$HOME/.dotfiles/hyprland/Sonata/.config/" "$HOME/.config/" ;;
  g) Symlinks "$HOME/.dotfiles/hyprland/Gruvbox/.config/" "$HOME/.config/" ;;
  esac
  ;;

e)
  echo "Aborting..."
  sleep 1
  exit 1
  ;;
esac
