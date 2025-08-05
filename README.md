### Hi there 👋
<!--
**pacoDan/pacoDan** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.

Here are some ideas to get you started:

- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
https://www.linkedin.com/pulse/decorar-perfil-de-github-con-readme-carlos-salvador/?originalSubdomain=es 
-->
# Script de personalizacion (ubuntu y debian) ok
```sh
sudo apt install -y --yes zsh ffmpeg libncurses-dev wget gcc make cmake vim nano ssh ufw unzip neofetch screenfetch gettext g++ tree gdb fd-find htop git curl xsel xclip wl-clipboard ripgrep plank flameshot tilix
```
```sh
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/script.sh | bash
```
## Script de personalizacion (Arch Linux)
```sh
sudo pacman -S --noconfirm zsh gcc make cmake unzip fastfetch screenfetch gettext gdb tree git curl wget vim openssh docker-buildx tree-sitter tree-sitter-lua tree-sitter-c tree-sitter-markdown tree-sitter-vim tree-sitter-vimdoc xsel wl-clipboard ripgrep fd lazygit htop docker plank flameshot gpaste nemo dolphin docker-compose timeshift redshift
```
## Script de personalizacion (Arch Linux) SERVER
```sh
sudo pacman -S --noconfirm zsh gcc make cmake unzip fastfetch screenfetch gettext vim nano gdb tree git curl wget openssh xclip docker-buildx tree-sitter tree-sitter-lua tree-sitter-c tree-sitter-markdown tree-sitter-vim tree-sitter-vimdoc xsel wl-clipboard ripgrep fd lazygit htop docker plank flameshot gpaste docker-compose timeshift
```
```sh
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/script_arch.sh | bash
```
### docker sin sudo
```sh
sudo usermod -aG docker ${USER}
sudo systemctl enable docker
sudo systemctl restart docker
newgrp docker
```
#### install temas e iconos mac desde:
https://github.com/vinceliuice/WhiteSur-icon-theme
https://github.com/vinceliuice/WhiteSur-gtk-theme ./install.sh -t all # instala todos los temas 
  ./tweaks.sh -f monterey
https://github.com/vinceliuice/Mojave-gtk-theme 
https://github.com/vinceliuice/WhiteSur-wallpapers ./install-wallpapers.sh
### instalación de oh my zsh & p10k
```
chsh -s $(which zsh)
```
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
```
`nano ~/.zshrc`
```
plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
)
```
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
```
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_MODE="nerdfont-complete"
```
---
# install nvim desde github (por lo tanto ultima version de nvim) EN ROOT
```sh
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/install_nvim.sh | bash
```
### instalacion + rapida de nvim EN ROOT
```sh
apt update && apt upgrade && apt install curl git && curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/install_nvim_instalable.sh | bash
```
## Script de bienvenida de la terminal
```sh
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/bienvenida_terminal.sh | bash
```
## plugins 🔨 para zsh y git ok
```sh
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/personalizar_zsh.sh | bash
```
## install miniconda 🐍 manualmente ok (revisar siempre https://docs.conda.io/en/main/miniconda.html )
```sh
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh
```
# install node y npm lts 18 ok
```sh
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/NodeJs18.sh | bash
```
# install de dotnet ok
```sh
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/instalacion_dotnet_6.sh | bash
```
# install de dotnet 7 ok
```sh
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/instalacion_dotnet_7.sh | bash
```
## install docker en ubutnu 22.04 (solo en root, añadir el usuario con otro script)
```sh
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/installDockerInUbuntu22_04.sh | bash
```
# install Lunar Vim IDE ok (recordar instalar git make gcc pip node etc etc )
## https://www.rust-lang.org/tools/install
## https://www.lunarvim.org/es/docs/installation

## script utils
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/utils.sh | bash  
## instalacion de docker en ubuntu 22 OK y despues ejecutar docker sin sudo
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/installDockerInUbuntu22.sh | bash
## docker sin sudo 
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/addUserInDocker.sh | bash
## Node.Js 18 NodeJs18.sh
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/NodeJs18.sh | bash
## conexiones remotas dentro de sql server ok
curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/conexiones_remotas_sql_server.sh | bash
[![Copiar línea de comando](https://img.shields.io/badge/Copiar%20l%C3%ADnea%20de%20comando-Clic%20aqu%C3%AD-blue.svg)](javascript:void(0); "onclick=copyToClipboard('curl -sS https://raw.githubusercontent.com/pacodan/pacodan/main/addUserInDocker.sh | bash')")


<h1 align="center">Hi 👋, I'm Jhon Daniel Olmedo Paco</h1>
<h3 align="center">A passionate frontend Java with Spring, JavaScript with Node.Js</h3>

<h3 align="left">Connect with me:</h3>
<p align="left">
<a href="https://dev.to/jhonpaco" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/devto.svg" alt="jhonpaco" height="30" width="40" /></a>
</p>

<h3 align="left">Languages and Tools:</h3>
<p align="left"> <a href="https://www.arduino.cc/" target="_blank" rel="noreferrer"> <img src="https://cdn.worldvectorlogo.com/logos/arduino-1.svg" alt="arduino" width="40" height="40"/> </a> <a href="https://azure.microsoft.com/en-in/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/microsoft_azure/microsoft_azure-icon.svg" alt="azure" width="40" height="40"/> </a> <a href="https://www.gnu.org/software/bash/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/gnu_bash/gnu_bash-icon.svg" alt="bash" width="40" height="40"/> </a> <a href="https://www.cprogramming.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/c/c-original.svg" alt="c" width="40" height="40"/> </a> <a href="https://www.w3schools.com/cpp/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/cplusplus/cplusplus-original.svg" alt="cplusplus" width="40" height="40"/> </a> <a href="https://www.w3schools.com/cs/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/csharp/csharp-original.svg" alt="csharp" width="40" height="40"/> </a> <a href="https://www.docker.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original-wordmark.svg" alt="docker" width="40" height="40"/> </a> <a href="https://dotnet.microsoft.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/dot-net/dot-net-original-wordmark.svg" alt="dotnet" width="40" height="40"/> </a> <a href="https://expressjs.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/express/express-original-wordmark.svg" alt="express" width="40" height="40"/> </a> <a href="https://git-scm.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/git-scm/git-scm-icon.svg" alt="git" width="40" height="40"/> </a> <a href="https://www.haskell.org/" target="_blank" rel="noreferrer"> <img src="https://upload.wikimedia.org/wikipedia/commons/1/1c/Haskell-Logo.svg" alt="haskell" width="40" height="40"/> </a> <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/javascript/javascript-original.svg" alt="javascript" width="40" height="40"/> </a> <a href="https://www.linux.org/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/linux/linux-original.svg" alt="linux" width="40" height="40"/> </a> <a href="https://mariadb.org/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/mariadb/mariadb-icon.svg" alt="mariadb" width="40" height="40"/> </a> <a href="https://www.mathworks.com/" target="_blank" rel="noreferrer"> <img src="https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png" alt="matlab" width="40" height="40"/> </a> <a href="https://www.microsoft.com/en-us/sql-server" target="_blank" rel="noreferrer"> <img src="https://www.svgrepo.com/show/303229/microsoft-sql-server-logo.svg" alt="mssql" width="40" height="40"/> </a> <a href="https://www.mysql.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="40" height="40"/> </a> <a href="https://postman.com" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/getpostman/getpostman-icon.svg" alt="postman" width="40" height="40"/> </a> <a href="https://spring.io/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/springio/springio-icon.svg" alt="spring" width="40" height="40"/> </a> </p>
