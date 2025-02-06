# add neovim repo
echo | sudo add-apt-repository ppa:neovim-ppa/stable  # simulating a keypress
# add essencial packages
sudo apt install git software-properties-common 
# install neovim, version in linux is too old for some package in neovim, decide to install standalone neovim
# sudo apt-get install -y neovim  # for typing 'yes'
wget https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz
sudo apt install tar
tar xzvf nvim-linux64.tar.gz

# install zig
sudo snap install zig --classic --beta
# symbolink zig/cpp/c compiler
sudo ln -sf /usr/bin/gcc /usr/bin/cc
echo 'alias cl="clang"' >> ~/.zshrc
source ~/.zshrc

# NOTE: need to config git first

# git init  # init git repo
# git branch -M master  # make main branch master
# git remote add origin https://github.com/davidgao7/homelab.git # link with remote git service provider
# git config --global --edit  # config .gitconfig file
# git commit --amend --reset-author # my 1st commit auto based on my username and hostname, need to change that
# git push -u origin master

# try ssh -T git@github.com if your vm can connect to github

# set ssh key pair
# generate a key pair with your github email
# ssh-keygen -t rsa -b 4096 -C "useremail.com"
# copy public key to github
cat ~/.ssh/id_rsa.pub
# install gnupg for signed commit
# sudo apt install gnupg -y
# gpg --full-generate-key
# follow the instructions

# you can check your signed in key by using
# gpg --list-secret-keys --keyid-format=long

# copy your copylic key
# gpg --armor --export $(
   # hash after 'sec'
# )

# set singingkey
# git config --global user.signingkey $(
    # hash after 'sec'
# )
# git config --global commit.gpgsign true

# =================neovim config===========
# git clone git@github.com:davidgao7/nvim-config.git
# cd nvim-config
# move config to .config to let lazy detect
# cd ~/.config/
# mv nvim-config/nvim .
# rm -rf nvim-config/

# install lazygit for better git integration
# LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
# curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
# tar xf lazygit.tar.gz lazygit
# sudo install lazygit -D -t /usr/local/bin/
# sudo mv lazygit /usr/bin
# rm lazygit.tar.gz

# install fzf
sudo apt install fzf

# install pyenv
# curl -fsSL https://pyenv.run | bash
# NOTE: remember to add scripts mentioned to activate pyenv

# essencial packages has python3, version python 3.12.3

# install pyright debugpy gopls to solve neovim error
# pyenv install 3.13.1

# get error: install python-3.13.1 fail
# BUILD FAILD (Ubuntu 24.04 using python-build 20180424)
# sudo apt-get update
# sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
# libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
# libncurses-dev xz-utils tk-dev libffi-dev \
# liblzma-dev python-openssl git

# install pip3
# sudo apt install -y python3-pip

# NOTE: check xz version, if the version is 5.6.0 or 5.6.1, it's crucial to update to 5.6.2 or later to mitigate potential security risks

xz --version
# xz (XZ Utils) 5.4.5
# liblzma 5.4.5

# sudo apt-get install python3-openssl

# install system level debugpy to get rid of mason error
# pip3 install debugpy

# install python venv
# curl https://pyenv.run | bash

# sudo apt-get update
# sudo apt-get install -y \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    liblzma-dev \
    libssl-dev \
    zlib1g-dev \
    libffi-dev \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    build-essential \
    checkinstall \
    libgdbm-dev \
    libc6-dev \
    libdb-dev

# install a python version, lets try latest one!
# pyenv install 3.13.1
# NOTE: pyenv install build from source, thats why it's slow
cd ~/homelab
pyenv local 3.13.1
pyenv exec python -m venv venv
venv/bin/python -m pip install --upgrade pip
venv/bin/python -m pip install debugpy

# install go java
sudo apt-get install -y golang python3 openjdk-11-jdk

# install debugpy in base env
python -m pip install debugpy

# install bat for cat
sudo apt install -y bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# install fd for venv-select
sudo apt install fd-find
sudo apt install unzip

# install nvm and npm for pyright
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc
source ~/.zshrc
cd ~/homelab
nvm use 16

# install zoxide, cannot leave without zoxide and fzf
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
echo 'eval "$(zoxide init bash)"' >> ~/.zshrc

# install nerdfonts
sudo apt install fontconfig
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip
uzip Hack.zip -d Hack
mkdir -p ~/.local/share/fonts
mv Hack/* ~/.local/share/fonts/
fc-cache -fv

# install zsh
sudo apt install -y zsh
# change default shell to zsh
chsh -s $(which zsh)
# install and configure oh my zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
# install and configure powerlevel10k
sh install.sh
# remove powerlevel10k's install.sh to prevent any misleading file names
rm install.sh
