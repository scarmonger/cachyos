#!/usr/bin/env python3

import secretstorage
from pykeepass import PyKeePass

def get_secret():
    connection = secretstorage.dbus_init()
    collection = secretstorage.get_default_collection(connection)

    items = collection.search_items({
        "application": "kp",
        "username": "mc",
    })

    item = next(items, None)

    if item is None:
        raise RuntimeError("Secret tidak ditemukan.")

    return item.get_secret().decode()


def get_sfpass():
    DATABASE = "/home/mc/Dropbox/demo.kdbx"
    MASTER_PASSWORD = get_secret()
    ENTRY_TITLE = "sf7doffice"

# Buka database KeePass
    kp = PyKeePass(
        str(DATABASE),
        password=MASTER_PASSWORD,
    )

# Cari entry (menggunakan recursive=True agar mencari di sub-group 'internal')
    entry = kp.find_entries(
        title=ENTRY_TITLE,
        first=True,
        recursive=True
    )

    if entry:
        # Mengambil password dari entry
        retrieved_password = entry.password
        
        # Mengambil username jika dibutuhkan
        retrieved_username = entry.username 
        
        # print(f"Password untuk '{ENTRY_TITLE}': {retrieved_password}")
        print(f"...")
    else:
        print(f"Entry '{ENTRY_TITLE}' tidak ditemukan!")

    return retrieved_password

def get_mailpass():
    DATABASE = "/home/mc/Dropbox/demo.kdbx"
    MASTER_PASSWORD = get_secret()
    ENTRY_TITLE = "zimbra"

# Buka database KeePass
    kp = PyKeePass(
        str(DATABASE),
        password=MASTER_PASSWORD,
    )

# Cari entry (menggunakan recursive=True agar mencari di sub-group 'internal')
    entry = kp.find_entries(
        title=ENTRY_TITLE,
        first=True,
        recursive=True
    )

    if entry:
        # Mengambil password dari entry
        retrieved_password = entry.password
        
        # Mengambil username jika dibutuhkan
        retrieved_username = entry.username 
        
        # print(f"Password untuk '{ENTRY_TITLE}': {retrieved_password}")
        print(f"Success")
    else:
        print(f"Entry '{ENTRY_TITLE}' tidak ditemukan!")

    return retrieved_password
# def main():
#     secret = get_secret()
#
#     print("Secret berhasil diambil.")
#
#     # Untuk testing saja
#     print("Secret:", secret)
#
#     print("Program melanjutkan eksekusi...")
#
#
# if __name__ == "__main__":
#     main()
