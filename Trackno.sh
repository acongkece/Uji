#!/bin/bash

untuk memeriksa apakah nomor telepon valid
check_number() {
    local number=$1
    if [[ $number =~ ^[0-9]+$ ]]; then
        echo "NOMOR VALID."
    else
        echo "NOMOR INVALID."
        exit 1
    fi
}

# Fungsi untuk mendapatkan informasi dasar dari nomor telepon
get_info() {
    local number=$1
    echo "Show Information: $number"

    # Menentukan kode negara berdasarkan prefix
    case ${number:0:2} in
        "62")
            country="Indonesia"
            country_code="+62"
            timezone="WIB"
            ;;
        "1")
            country="Amerika Serikat"
            country_code="+1"
            timezone="EST"
            ;;
        "44")
            country="Inggris"
            country_code="+44"
            timezone="GMT"
            ;;
        "91")
            country="India"
            country_code="+91"
            timezone="IST"
            ;;
        "81")
            country="Jepang"
            country_code="+81"
            timezone="JST"
            ;;
        *)
            country="Tidak diketahui"
            country_code="Tidak diketahui"
            timezone="Tidak diketahui"
            ;;
    esac

    # Menentukan operator berdasarkan prefix nomor telepon
    case ${number:2:4} in
        "0811"|"0812"|"0813"|"0821"|"0822"|"0823"|"0852"|"0853"|"0851")
            operator="Telkomsel"
            ;;
        "0814"|"0815"|"0816"|"0855"|"0856"|"0857"|"0858")
            operator="Indosat"
            ;;
        "0817"|"0818"|"0819"|"0859"|"0877"|"0878")
            operator="XL"
            ;;
        "0896"|"0897"|"0898"|"0899")
            operator="Three"
            ;;
        "0881"|"0882"|"0883"|"0884"|"0885"|"0886"|"0887"|"0888"|"0889")
            operator="Smartfren"
            ;;
        *)
            operator="Tidak diketahui"
            ;;
    esac

    # Format nomor telepon
    mobile_format=${number:2}
    international_format="$country_code ${number:2}"
    e164_format="$country_code$mobile_format"
    original_format="$number"

    echo "Region              : $country"
    echo "Region Code         : $country_code"
    echo "Operator            : $operator"
    echo "Jenis               : Prabayar"
    echo "Format Mobile       : $mobile_format"
    echo "Format Internasional: $international_format"
    echo "Format E.164        : $e164_format"
    echo "Format Asli         : $original_format"
    echo "Zona Waktu          : $timezone"
}

# Meminta input nomor telepon dari pengguna
read -p "input nomor(62): " phone_number

# Memeriksa validitas nomor telepon
check_number $phone_number

# Mendapatkan informasi dari nomor telepon
get_info $phone_number
