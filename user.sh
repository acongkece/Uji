#!/bin/bash

# Meminta input username dari pengguna
read -p "Masukkan username: " username

# Daftar situs yang akan diperiksa
sites=(
    "https://www.github.com/$username"
    "https://www.twitter.com/$username"
    "https://www.instagram.com/$username"
    "https://www.linkedin.com/in/$username"
    "https://www.facebook.com/$username"
    "https://www.tiktok.com/$username"
    "https://www.id.pinterest.com/$username"
)

echo "Mencari informasi untuk username: $username"

# Memeriksa setiap situs
for site in "${sites[@]}"; do
    response=$(curl -s -o /dev/null -w "%{http_code}" "$site")
    if [ $response -eq 200 ]; then
        echo "Ditemukan: $site"
    else
        echo "Tidak ditemukan: $site"
    fi
done
