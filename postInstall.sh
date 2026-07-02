# required packages are listed below as zypper(openSUSE) commands but the same packages can be installed on any distribution and the rest of the script will work fine. Thank you.
#!/bin/bash
# installation and initial setup
sudo zypper in git git-lfs wget curl make gcc gcc-c++ fastfetch starship neovim kitty alacritty
echo 'eval "$(starship init bash)"' >>~/.bashrc
cd ~/.local/share/
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source -- ~/.local/share/blesh/ble.sh' >>~/.bashrc
# config placement
cp -rf alacritty ~/.config/
cp -rf kitty ~/.config/
fastfetch --gen-config
rm ~/.config/fastfetch/config.jsonc
cd ~/.local/share/
git clone https://github.com/Kaushik3207/myConfigs.git
cd myConfigs
rm -rf .git/
cp -rfu nvim/ ~/.config/
cp starship/starship.toml ~/.config/
cp konsole/kaushiksColourScheme.colorscheme ~/.local/share/konsole/
echo 'fastfetch' >>~/.bashrc
# font installation
# the following set of commands install all the fonts in the fonts directory system-wide
sudo cp -rf fonts/. /usr/local/share/fonts/
fc-cache -f
# AppImage(s) installation (user-specific)
mkdir -p ~/opt/
cp -rf applications/. ~/opt/
