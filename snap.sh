sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt install snapd
snap install hello-world
