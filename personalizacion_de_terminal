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

# Make sure to backup the original motd file
sudo cp /etc/motd /etc/motd.backup

# Write the new message to the motd file
echo "$new_message" | sudo tee /etc/motd

echo "New message of the day has been set!"
