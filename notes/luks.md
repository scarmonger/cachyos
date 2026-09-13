# Change password Luks
sudo cryptsetup luksChangeKey /dev/sda2

# Verifikasi Passphrase Baru
sudo cryptsetup open --test-passphrase /dev/sda2
