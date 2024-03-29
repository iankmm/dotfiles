sudo apt-get -y update

# copy vimrc
cp ~/dotfiles/vimrc ~/.vimrc

# tmux conf
cp ~/dotfiles/tmux.conf ~/.tmux.conf

# essentials
sudo apt-get -y install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential openssl liblzma-dev pkg-config ruby-dev patchelf tmux vim curl gdb elfutils

# install pwntools
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade pwntools

# download rust, since it's only for pwninit I don't think it's needed for now.. <- I was wrong.. I do need pwninit for setup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo 'source "$HOME/.cargo/env"' >> ~/.bashrc
source "$HOME/.cargo/env"
source ~/.bashrc

# # download pwninit
cargo install pwninit
echo "alias pwninit='pwninit --template-path ~/.pwninit-template.py --template-bin-name e'" >> ~/.bashrc
cp ./pwninit-template.py ~/.pwninit-template.py

if test -f ~/.gdbinit; then
  echo "GDB exists!"
else
# gdb peda
git clone https://github.com/longld/peda.git ~/peda
# pwngdb by angelboy
cd ~/
git clone https://github.com/scwuaptx/Pwngdb.git 
cp ~/Pwngdb/.gdbinit ~/
fi

# one_gadget
sudo gem install one_gadget

export PATH:~/.local/bin/:$PATH

# reload settings
source ~/.bashrc

# init ctf setting
cd ~
mkdir ctf
