#! /bin/sh

#		This script is probably not good, but it took me like 4 hours and (in theory) it works, so im very proud of it :)

#------------------ IF 1 START ------------------
if [ -d "$HOME/.config/" ]; then

    echo "~/.config directory already exists, checking for files/subdirectories..." 
    echo " "
    echo " "

#       ------------------ IF 2 START ------------------
#       Comprueba si $HOME/.config existe y si tiene directorios
        if [ -d "$HOME/.config/" ] && [ "$(ls -A "$HOME/.config/")" ]; then

#               Cuenta la cantidad de archivos y directorios en ~/.config
                files=$(find "$HOME/.config" -type f | wc -l)
                dirs=$(find "$HOME/.config" -type d | wc -l)

#               Resta 1 al resultado (El directorio en si tambien se cuenta, asi que se quita 1)
                dirs=$((dirs -1))
        
#--------------------------------- PROMPT 1 START ---------------------------------
#       Crea un prompt para decidir si hacer un backup de .config o no
        echo "~/.config has $dirs directories and $files, if you want to install this config in here, you need to make a backup of your current .config folder."
        echo " "
        echo "Do you want to automatically make a backup of your .config directory?"
        echo " "
        sleep 0.3
        echo "Yes (y) (This will change your /home/<user>/.config name to .config.bak)"
        echo "No (n) This will exit the installation process and WON'T change any of your files"
        read -p "" response

        
#       Transforma cualquier input en mayus a un imput en minus        
        response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

#       Revisa la respuesta 
#               ------------------ IF 3 START ------------------
                if [[ "$response" == "y" ]]; then

#                       Create .config.backup
                        echo "Creating backup..."
                        sleep 1
                        mv "$HOME/.config" "$HOME/.config.bak"
                        sleep 0.5
                        echo "Done"

#                       Sleep
                        echo " "
                        sleep 1

#                       Create another .config directory and move everything
                        echo "Creating new .config directory on /home/<user>/"
                        mkdir $HOME/.config
                        sleep 0.3
                        echo "Moving configuration files into ~/.config..."
                        cp -r .config/* $HOME/.config
                        sleep 0.5
                        echo "Done. Reboot your system to apply"
                        exit

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

#               ------------------ IF 3 END ------------------
                fi


#--------------------------------- PROMPT 1 END ---------------------------------

#               Cierra el script
                exit 

        else

#--------------------------- ------ PROMPT 2 START ---------------------------------
#       Crea un prompt para decidir si usar el directorio $HOME/.config  o no
        read -p "~/.config is empty, would you like to use it for the config install? (Y/N):  " response
        
#       Transforma cualquier input en mayus a un imput en minus        
        response=$(echo "$response" | tr '[:upper:]' '[:lower:]')

#       Revisa la respuesta 
#               ------------------ IF 4 START ------------------
                if [[ "$response" == "y" ]]; then

                        echo "Proceeding..."

                        sleep 1
                        
                        echo "Moving configuration files into ~/.config..."
                        cp -r .config/* $HOME/.config
                        sleep 0.5
                        echo "Done. Reboot your system to apply"
                        exit

                elif [[ "$response" == "n" ]]; then

                        echo "Aborting..."
                        sleep 1
                        exit
                else
                        echo "Invalid input. Aborting..."
                        sleep 1
                        exit

#               ------------------ IF 4 END ------------------
                fi


#--------------------------------- PROMPT 2 END ---------------------------------

#       ------------------ IF 2 END ------------------
        fi



else
#       Create another .config directory and move everything
        echo "Creating new .config directory on /home/<user>/"
        mkdir $HOME/.config
        sleep 0.3
        echo "Moving configuration files into ~/.config..."
        cp -r .config/* $HOME/.config
        sleep 0.5
        echo "Done. Reboot your system to apply"
        exit
#------------------ IF 1 END ------------------

fi

