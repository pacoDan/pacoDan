#!/bin/bash

# Art ASCII del mensaje de bienvenida
art_ascii=$(cat << "EOF"
     ____                                 ____
   / __ )__  _____  ____  ____ ______   / / /
  / __  / / / / _ \/ __ \/ __ `/ ___/  / / / 
 / /_/ / /_/ /  __/ / / / /_/ (__  )  /_/_/  
/_____/\__,_/\___/_/ /_/\__,_/____/  (_|_)   
                                             
       ____                   ____              _      __
      / / /_  ____  ____     / __ \____ _____  (_)__  / /
 __  / / __ \/ __ \/ __ \   / / / / __ `/ __ \/ / _ \/ / 
/ /_/ / / / / /_/ / / / /  / /_/ / /_/ / / / / /  __/ /  
\____/_/ /_/\____/_/ /_/  /_____/\__,_/_/ /_/_/\___/_/   
EOF
)

# Agregar el arte ASCII al archivo .zshrc
echo "$art_ascii" >> ~/.zshrc

echo "Mensaje de bienvenida personalizado agregado al archivo .zshrc!"
