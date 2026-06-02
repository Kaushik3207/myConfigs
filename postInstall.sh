#!/bin/bash
echo 'eval "$(starship init bash)"' >>~/.bashrc
cd ~/.local/share/
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source -- ~/.local/share/blesh/ble.sh' >>~/.bashrc
fastfetch --gen-config
rm ~/.config/fastfetch/config.jsonc
cd ~/.local/share/
git clone https://github.com/Kaushik3207/myConfigs.git
cd myConfigs
cp -rfu nvim/ ~/.config/
cp starship/starship.toml ~/.config/
cp konsole/kaushiksColourScheme.colorscheme ~/.local/share/konsole/
mv fonts/'DepartureMono(Default)'/ fonts/d/
mv fonts/BigTermFont/ fonts/b/
sudo cp -rf fonts/d /usr/local/share/fonts/
sudo cp -rf fonts/b /usr/local/share/fonts/
fc-cache -f
cp -rf alacritty ~/.config/
cp -rf kitty ~/.config/
