#!/usr/bin/env python3

import secretstorage


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


def main():
    secret = get_secret()

    print("Secret berhasil diambil.")

    # Untuk testing saja
    print("Secret:", secret)

    print("Program melanjutkan eksekusi...")


if __name__ == "__main__":
    main()
