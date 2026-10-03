# main

(Focus) Switch to desktop : M + {A,S,D,F,E,R,T}
(Move) Window to desktop : M + {A,S,D,F,E,R,T}
(Move) Window one desktop to the right : M+Sh+I, M+Ctrl+Sh+L
(Move) Window one desktop to the left : M+Sh+U, M+Ctrl+Sh+H

sudo pacman -Syu
sync firefox

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

i3i12100:
sudo echo "UUID=42a81fd4-b149-49a7-9103-a221c9cad43b /home/mc/marc/ ext4 errors=remount-ro 0 1" | sudo tee -a /etc/fstab

sudo mount -a
systemctl daemon-reload

## github-cli authentication

sudo pacman -S --noconfirm github-cli

<https://cli.github.com/manual/>

```
git config --global user.email "psikomania@yahoo.com"
git config --global user.name "scarmonger"

git config user.email "mc@i3.com"
git config user.name "i3"
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
git clone git@github.com:scarmonger/cachyos.git

```
git remote set-url origin git@github.com:scarmonger/cachyos.github
```

## buat symlink ke file config

cd ~/marc/github/cachyos/
./link_dotfile.sh

## Install Yay

sudo pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

## Install google-chrome

yay -S --noconfirm google-chrome
sudo pacman -S --noconfirm chromium

## Setup /etc/sudoers

sudo visudo
add this on the end of file : Defaults !tty_tickets

## install essentials

sudo pacman -S --noconfirm vi nvim wl-clipboard lazygit rofi
sudo pacman -S --noconfirm ranger kitty zoxide trash-cli bat
sudo pacman -S --noconfirm python python-pip
yay -S --noconfirm mmtui-bin

sudo pacman -S --noconfirm zsh
echo "source /home/mc/marc/github/cachyos/zsh-addon" >> ~/.zshrc

mkdir -p ~/.local/bin
ln -ivs /home/mc/marc/github/cachyos/local/bin/custom ~/.local/bin

### Ranger plugins

git clone https://gitlab.com/Ragnyll/ranger-gpg.git
cd ranger-gpg
pip install python-gnupg --break-system-packages
make install

cd ~/.config/ranger/plugins
git clone https://github.com/maximtrp/ranger-archives.git

## Tmux

i --noconfirm tmux
mkdir -p ~/.config/tmux-plugins
rm -Rf ~/marc/github/cachyos/config/tmux/plugins/
git clone https://github.com/tmux-plugins/tpm home/mc/.config/tmux-plugins/tpm
<!-- ln -ivs /home/mc/marc/github/cachyos/config/nvim/lua/plugins/vim-tmux-navigator.lua ~/.config/nvim/lua/config/ -->
<!-- ln -ivs ~/marc/github/cachyos/config/tmux ~/.config/ -->

ctrl + B + capital I = install plugin
ctrl + space + capital I = install plugin

## Dropbox

sudo pacman -S --noconfirm python-gpgme libappindicator
yay -S --noconfirm dropbox

## install secret-key

secret-tool store --label="kp" application kp username mc
i --noconfirm seahorse

## Install other app (sudo pacman -S)

sudo pacman -S --noconfirm npm
sudo npm install -g markdownlint-cli2

sudo pacman -S ksnip --noconfirm
sudo pacman -S ncdu copyq --noconfirm

sudo pacman -S zathura-cb zathura-djvu zathura-pdf-poppler zathura-ps foliate --noconfirm

sudo pacman -S keepassxc veracrypt --noconfirm
sudo pacman -S dbeaver filezilla --noconfirm
sudo pacman -S telegram-desktop --noconfirm
sudo pacman -S gimp obs-studio --noconfirm
i libreoffice-still --noconfirm

yay -S wps-office ttf-wps-fonts freetype2-wps libtiff5 --noconfirm
yay -S visual-studio-code-bin --noconfirm

sudo pacman -S --noconfirm nushell jq remmina freerdp gnome-calculator thunar
yay -S --noconfirm jqp-bin zoom

sudo pacman -S thunderbird --noconfirm

> [!NOTE]
> Truncate obsidian

### thunderbird setup

Help -> troubleshooting information
search and click link -> about:profiles -> create a new profile -> choose folder

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

## Tailscale

curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
sudo tailscale down

## projectlibre

yay -S --noconfirm projectlibre
sudo pacman -S --noconfirm jdk25-openjdk

sudo archlinux-java set java-25-openjdk
archlinux-java status

<https://aur.archlinux.org/packages/projectlibre>
<https://wiki.archlinux.org/title/Java#Switching_between_JVM>

## yt-dlp

sudo rm ~/.local/bin/yt-dlp
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /home/mc/.local/bin/yt-dlp
chmod a+rx ~/.local/bin/yt-dlp # Make executable

## Install python,pip & selenium

yay -S python-clipman mycli --noconfirm
python3 -m pip install --user selenium --break-system-packages
pip install pykeepass --break-system-packages

sudo pacman -S python-pandas --noconfirm

## virtualbox

uname -r : 7.2.5-1-cachyos
sudo pacman -S virtualbox virtualbox-host-dkms

restart sebelum coba run vbox

## rustdesk

sudo pacman -U rustdesk-1.4.4-0-x86_64.pkg.tar.zst

**Supaya Rust tidak ikut diupdate secara rutin**
pada /etc/pacman.conf cari, unremark dan tambahkan:
IgnorePkg = rustdesk

sudo vi /etc/pacman.conf

## VPN

sudo pacman -S --noconfirm networkmanager-l2tp strongswan xl2tpd

> [!NOTE]
> nm to call vpn setup

## Android screen sharing

sudo pacman -S scrcpy --noconfirm

Steps:

1. Enable Developer Options → USB Debugging on your phone
2. Connect phone via USB
3. Run: `scrcpy`
4. Additional: Developer Options -> show taps : on

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

## Create symlink

ln -ivs ~/marc/github/cachyos/.gitconfig ~/

ln -ivs ~/marc/virtualbox "/home/mc/VirtualBox VMs"
ln -ivs /home/mc/marc/github/cachyos/config/myclirc ~/.myclirc

ln -ivs /home/mc/marc/custom/source/commandbox/box ~/.local/bin/
ln -ivs /home/mc/marc/custom/source/commandbox/jre ~/.local/bin/

cp /home/mc/marc/github/ubuntu/HubApps /home/mc/.config/microsoft-edge/Default/HubApps

## Wallpaper

```
git clone https://github.com/mylinuxforwork/wallpaper.git /home/mc/marc/pics/wallpaper
```

## Gemini

sudo npm install -g @google/gemini-cli

Paksa Mode Gelap untuk Semua Situs Web (Auto Dark Mode)Jika Anda ingin memaksa seluruh halaman web tampil gelap, gunakan fitur eksperimental:Ketik chrome://flags di bilah alamat (address bar), lalu tekan Enter.Ketik dark mode pada kotak pencarian di bagian atas.Cari opsi Auto Dark Mode for Web Contents.Ubah menu drop-down dari Default menjadi Enabled

## Error saat install package

Corrupted file detected and repaired: /boot/ba4f1adcb6af4dd4b55597e904b0d599/limine_history/initramfs_sha256_80d4d0f1ec25fc703e244b50e1cce89e4ce441e89d9374f056055b2bf6643fa3

sudo limine-mkinitcpio
sudo limine-update

## apabila error ketika update pacman

❯ sudo pacman -Syu
error: cachyos: signature from "CachyOS <admin@cachyos.org>" is invalid
:: Synchronizing package databases...
cachyos-v3 is up to date
cachyos-extra-v3 is up to date
cachyos-core-v3 is up to date
cachyos 515.5 KiB 2.66 MiB/s 00:00 [------------------------------------] 100%
core is up to date
extra is up to date
multilib is up to date
error: cachyos: signature from "CachyOS <admin@cachyos.org>" is invalid
error: failed to synchronize all databases (unexpected error)

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

