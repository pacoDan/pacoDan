#!/bin/bash

new_message=$(cat << "EOF"
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

# Determine the MOTD file location based on the user's home directory
normal_user_motd_file="$HOME/.motd"
root_user_motd_file="/root/.motd"

# Write the new message to the user's MOTD file
echo "$new_message" > "$normal_user_motd_file"
sudo cp "$normal_user_motd_file" "$root_user_motd_file"

echo "New message of the day has been set for your user account and root user!"
