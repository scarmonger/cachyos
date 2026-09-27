# main

(Focus) Switch to desktop : M + {A,S,D,F,E,R,T}
(Move) Window to desktop : M + {A,S,D,F,E,R,T}
(Move) Window one desktop to the right : M+Sh+I, M+Ctrl+Sh+L
(Move) Window one desktop to the left : M+Sh+U, M+Ctrl+Sh+H

sudo pacman -Syu
sync firefox

## apabila error ketika update pacman
❯ sudo pacman -Syu
error: cachyos: signature from "CachyOS <admin@cachyos.org>" is invalid
:: Synchronizing package databases...
 cachyos-v3 is up to date
 cachyos-extra-v3 is up to date
 cachyos-core-v3 is up to date
 cachyos                               515.5 KiB  2.66 MiB/s 00:00 [------------------------------------] 100%
 core is up to date
 extra is up to date
 multilib is up to date
error: cachyos: signature from "CachyOS <admin@cachyos.org>" is invalid
error: failed to synchronize all databases (unexpected error)

```sh
# 1. Remove the old/corrupted GPG keyring directory
sudo rm -rf /etc/pacman.d/gnupg/

# 2. Re-initialize a fresh local keyring environment
sudo pacman-key --init

# 3. Install/sync the latest keyrings before populating
sudo pacman -Sy archlinux-keyring cachyos-keyring

# 4. Populate the default keys for both Arch and CachyOS
sudo pacman-key --populate archlinux cachyos

# 5. Perform a full system upgrade
sudo pacman -Syyu

sudo cachyos-rate-mirrors
sudo pacman -Syyu

## mount drive

mkdir -p ~/marc/

m720q:
sudo echo "UUID=8f4825e2-0016-43c2-994a-bb2830ddaea9 /home/mc/marc/ ext4 errors=remount-ro 0 1" | sudo tee -a /etc/fstab

tp13:
sudo echo "UUID=3cb910c9-2e1e-4910-a6a9-c114df09d3cd /home/mc/marc/ ext4 errors=remount-ro 0 1" | sudo tee -a /etc/fstab

dell:
sudo echo "UUID=6b617826-89bc-444c-9b72-9bcf0c44eb73 /home/mc/marc/ ext4 errors=remount-ro 0 1" | sudo tee -a /etc/fstab

otg-rtl:
sudo echo "UUID=11d2f506-0797-45dd-8b51-cbc0e9b2c6fa /home/mc/marc/ ext4 errors=remount-ro 0 1" | sudo tee -a /etc/fstab
sudo echo "UUID=8f4825e2-0016-43c2-994a-bb2830ddaea9 /home/mc/Templates/ ext4 errors=remount-ro 0 1" | sudo tee -a /etc/fstab

sudo mount -a
systemctl daemon-reload


## Install google-chrome

sudo pacman -S chromium

## Install Yay
```sh 
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S --noconfirm google-chrome
```

## install essentials

```bash
sudo pacman -S vi nvim wl-clipboard lazygit rofi
ln -ivs /home/mc/marc/github/cachyos/config/nvim ~/.config/

## Setup /etc/sudoers

sudo visudo
add this on the end of file : Defaults !tty_tickets

sudo pacman -S ranger kitty zoxide trash-cli bat
sudo pacman -S python python-pip
yay -S mmtui-bin

rm -Rf ~/.config/ranger
ln -ivs ~/marc/github/cachyos/config/ranger ~/.config/

rm -Rf ~/.config/kitty
ln -ivs ~/marc/github/cachyos/config/kitty/ ~/.config/

git clone https://gitlab.com/Ragnyll/ranger-gpg.git
cd ranger-gpg
pip install python-gnupg --break-system-packages
make install

cd ~/.config/ranger/plugins
git clone https://github.com/maximtrp/ranger-archives.git

sudo pacman -S zsh
echo "source /home/mc/marc/github/cachyos/zsh-addon" >> ~/.zshrc

mkdir -p ~/.local/bin
ln -ivs ~/marc/github/cachyos/local/bin/custom ~/.local/bin
```


### Rubah default shell bin bash menjadi zsh (harus logout)

chsh -s /usr/bin/zsh
restart

### Tmux

```sh
i tmux
mkdir -p ~/.config/tmux-plugins
ln -ivs /home/mc/marc/github/cachyos/config/nvim/lua/plugins/vim-tmux-navigator.lua ~/.config/nvim/lua/config/
ln -ivs ~/marc/github/cachyos/config/tmux ~/.config/
rm -Rf ~/marc/github/cachyos/config/tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux-plugins/tpm
```

ctrl + B + capital I = install plugin
ctrl + space + capital I = install plugin

## Dropbox Headless Install via command line

The Dropbox daemon is only compatible with 64-bit Linux servers. To install, run the following command in your Linux terminal.
```bash
cd ~ && wget -O - https://www.dropbox.com/download?plat=lnx.x86_64 | tar xzf -
Next, run the Dropbox daemon from the newly created .dropbox-dist folder.

~/.dropbox-dist/dropboxd

wget -O ~/.local/bin/dropbox https://www.dropbox.com/download?dl=packages/dropbox.py
chmod +x ~/.local/bin/dropbox

dropbox autostart y
```


sudo pacman -S libappindicator

## install secret-key

secret-tool store --label="kp" application kp username mc
i seahorse

## Install other app (sudo pacman -S)

i npm
sudo npm install -g markdownlint-cli2

sudo pacman -S ksnip --noconfirm
rm -rf ~/.config/ksnip/
ln -ivs ~/marc/github/cachyos/config/ksnip/ ~/.config/

sudo pacman -S ncdu copyq --noconfirm

sudo pacman -S zathura-cb zathura-djvu zathura-pdf-poppler zathura-ps foliate --noconfirm
ln -ivs ~/marc/github/cachyos/config/zathura ~/.config/

sudo pacman -S keepassxc obsidian veracrypt --noconfirm
sudo pacman -S dbeaver filezilla --noconfirm
sudo pacman -S telegram-desktop --noconfirm
sudo pacman -S gimp obs-studio --noconfirm
i libreoffice-still

yay -S wps-office ttf-wps-fonts freetype2-wps libtiff5 --noconfirm
yay -S visual-studio-code-bin

sudo pacman -S thunderbird --noconfirm

## change mac address

sudo pacman -S macchanger
sudo macchanger -s eno1
sudo macchanger -m 6c:0b:84:22:be:c4 eno1

sudo pacman -S cronie
sudo EDITOR=nano crontab -e
@reboot macchanger -m 6c:0b:84:22:be:c4 eno1
@reboot tailscale up

sudo systemctl enable --now cronie
sudo systemctl status cronie
sudo systemctl start tailscaled

> [!NOTE] Notes
> sudo tailscale up
> sudo tailscale down

## Tailscale

curl -fsSL <https://tailscale.com/install.sh> | sh
sudo tailscale up

### thunderbird setup

Help -> troubleshooting information
search and click link -> about:profiles -> create a new profile -> choose folder

sudo pacman -S --noconfirm networkmanager-l2tp strongswan xl2tpd

> nm to call vpn setup

i nushell jq
yay -S jqp-bin

yay -S --noconfirm zoom
yay -S microsoft-edge-stable-bin --noconfirm

i remmina freerdp
i gnome-calculator thunar

### Android screen sharing

sudo pacman -S scrcpy

Steps:

1. Enable Developer Options → USB Debugging on your phone
2. Connect phone via USB
3. Run: `scrcpy`
4. Additional: Developer Options -> show taps : on

## projectlibre

yay -S --noconfirm projectlibre
sudo pacman -S jdk25-openjdk

archlinux-java status
sudo archlinux-java set java-25-openjdk

<https://aur.archlinux.org/packages/projectlibre>
<https://wiki.archlinux.org/title/Java#Switching_between_JVM>

## github-cli authentication

i github-cli

<https://cli.github.com/manual/>

```
git config --global user.email "psikomania@yahoo.com"
git config --global user.name "scarmonger"

git config user.email "psikomania@yahoo.com"
git config user.name "scarmonger"
```

### Generate a new SSH Key

ssh-keygen -t ed25519 -C "<psikomania@yahoo.com>"

### Start the ssh-agent in the background

eval "$(ssh-agent -s)"

fish:
eval (ssh-agent -c)

### Adding SSF Key to SSH-Agent

ssh-add ~/.ssh/id_ed25519

### Adding a new SSH key to your github account

gh auth login
gh auth refresh -h github.com -s admin:ssh_signing_key

check method currently use to communicating with github
git remote -v

set the method using ssh instead of https
```
git remote set-url origin git@github.com:scarmonger/cachyos.git
```

## Create symlink

```sh
ln -ivs ~/marc/github/cachyos/.gitconfig ~/

ln -ivs ~/marc/virtualbox "/home/mc/VirtualBox VMs"
ln -ivs /home/mc/marc/github/cachyos/config/myclirc ~/.myclirc

ln -ivs /home/mc/marc/custom/source/commandbox/box ~/.local/bin/
ln -ivs /home/mc/marc/custom/source/commandbox/jre ~/.local/bin/


cp /home/mc/marc/github/ubuntu/HubApps /home/mc/.config/microsoft-edge/Default/HubApps

```


## Wallpaper

```
git clone https://github.com/mylinuxforwork/wallpaper.git /home/mc/marc/pics/wallpaper
```

## Install python,pip & selenium

yay -S python-clipman mycli --noconfirm
python3 -m pip install --user selenium --break-system-packages
pip install pykeepass --break-system-packages

sudo pacman -S python-pandas --noconfirm
<!-- yay -S pyinstaller python-selenium -->

## virtualbox

uname -r : 7.2.5-1-cachyos
sudo pacman -S virtualbox virtualbox-host-dkms

restart sebelum coba run vbox

<!-- 6.18.2-2-cachyos -->
<!-- sudo pacman -S linux-cachyos-headers virtualbox virtualbox-host-dkms -->
<!---->
<!-- sudo usermod -aG vboxusers $USER -->
<!-- sudo modprobe vboxdrv -->
<!-- yay -S virtualbox-ext-oracle -->
<!-- sudo modprobe -r kvm_intel -->

## rustdesk

sudo pacman -U rustdesk-1.4.4-0-x86_64.pkg.tar.zst

**Supaya Rust tidak ikut diupdate secara rutin**
pada /etc/pacman.conf cari, unremark dan tambahkan:
IgnorePkg = rustdesk

sudo vi /etc/pacman.conf

## Clamav

<https://wiki.archlinux.org/title/ClamAV>

i clamav

sudo ln -ivs /home/mc/marc/github/cachyos/etc/clamav/clamd.conf /etc/clamav
sudo ln -ivs /home/mc/marc/github/cachyos/etc/clamav/virus-event.bash /etc/clamav

freshclam
clamscan -r ~/ -l ~/scanresult.txt

sudo systemctl enable clamav-daemon
sudo systemctl start clamav-daemon
sudo systemctl stop clamav-daemon

sudo systemctl enable clamav-daemon.socket
sudo systemctl start clamav-daemon.socket
sudo systemctl stop clamav-daemon.socket

### Check for virus definition update

clamscan --version

## yt-dlp

sudo rm ~/.local/bin/yt-dlp
```
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
chmod a+rx ~/.local/bin/yt-dlp # Make executable

```
## Gemini

sudo npm install -g @google/gemini-cli

Paksa Mode Gelap untuk Semua Situs Web (Auto Dark Mode)Jika Anda ingin memaksa seluruh halaman web tampil gelap, gunakan fitur eksperimental:Ketik chrome://flags di bilah alamat (address bar), lalu tekan Enter.Ketik dark mode pada kotak pencarian di bagian atas.Cari opsi Auto Dark Mode for Web Contents.Ubah menu drop-down dari Default menjadi Enabled

## Error saat install package

Corrupted file detected and repaired: /boot/ba4f1adcb6af4dd4b55597e904b0d599/limine_history/initramfs_sha256_80d4d0f1ec25fc703e244b50e1cce89e4ce441e89d9374f056055b2bf6643fa3

sudo limine-mkinitcpio
sudo limine-update

