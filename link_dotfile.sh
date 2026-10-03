#!/usr/bin/env bash

set -euo pipefail

# Definisi Direktori
SOURCE_DIR="$HOME/marc/github/cachyos/config"
TARGET_DIR="$HOME/.config"

# Pastikan direktori sumber ada
if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Error: Direktori sumber '$SOURCE_DIR' tidak ditemukan!"
  exit 1
fi

# Pastikan direktori target ada
mkdir -p "$TARGET_DIR"

echo "Memproses symlink otomatis dari '$SOURCE_DIR' ke '$TARGET_DIR'..."
echo "------------------------------------------------------------------"

# Mengaktifkan dotglob agar file/folder tersembunyi (diawali titik) ikut terdeteksi
shopt -s dotglob

for source_path in "$SOURCE_DIR"/*; do
  # Jika folder kosong, akhiri loop
  [[ -e "$source_path" ]] || continue

  item=$(basename "$source_path")
  target_path="$TARGET_DIR/$item"

  # 1. Hapus file, folder, atau symlink yang ada di ~/.config jika namanya sama
  if [[ -e "$target_path" || -L "$target_path" ]]; then
    echo "[Hapus] Menghapus '$target_path'..."
    rm -rf "$target_path"
  fi

  # 2. Buat symlink baru
  echo "[Symlink] $target_path -> $source_path"
  ln -s "$source_path" "$target_path"
done

# Kembalikan opsi dotglob ke default
shopt -u dotglob

echo "------------------------------------------------------------------"
echo "Selesai! Semua item dari '$SOURCE_DIR' berhasil di-symlink ke '$TARGET_DIR'."
