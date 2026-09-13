# ranger

https://github.com/ranger/ranger/wiki
https://github.com/ranger/ranger/wiki/Plugins

To generate the original configuration files for the ranger file manager, run the command `ranger --copy-config=all` in your terminal. This copies the default system files into your local user directory at

> To stop ranger from loading both the default and your custom rc.conf,
  please set the environment variable RANGER_LOAD_DEFAULT_RC to FALSE.

## ranger gpg plugins
https://gitlab.com/Ragnyll/ranger-gpg
```
git clone https://gitlab.com/Ragnyll/ranger-gpg.git
cd ranger-gpg
pip install python-gnupg
make install
```

# Config nemo for bulk-rename
thunar --bulk-rename


# Setup default app untuk suatu filetype
xdg-mime default projectlibre.desktop application/octet-stream

xdg-mime default mpv.desktop audio/mpeg
xdg-mime default mpv.desktop video/webm

## check mime filetype
xdg-mime query filetype nama_file.pod
> octet-stream


sudo pacman -S imagemagick expac --noconfirm
i imv swayimg
yay -S --noconfirm windsurf zellij pinta librewolf-bin gradia

ln -ivs ~/marc/github/cachyos/config/fish/ ~/.config/
ln -ivs ~/marc/github/cachyos/config/zellij ~/.config/

ln -ivs ~/marc/github/cachyos/config/keepassxc/ ~/.config/
ln -ivs ~/marc/github/cachyos/config/swayimg/ ~/.config/
ln -ivs ~/marc/github/cachyos/config/imv/ ~/.config/

ln -ivs ~/marc/github/cachyos/config/mpv ~/.config/
