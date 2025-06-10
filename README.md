# Cardigan_Collection

Aplikasi cardigan_collection adalah aplikasi e-commerce sederhana berbasis Flutter yang dirancang untuk menjual berbagai jenis cardigan dengan tampilan menarik dan pengalaman pengguna yang mudah digunakan. Aplikasi ini memiliki beberapa fitur seperti:
1. Menelusuri koleksi cardigan berdasarkan kategori atau popularitas.
2. Melihat detail produk seperti harga, deskripsi, dan foto.
3. Menambahkan produk ke keranjang belanja.
4. Melakukan proses checkout dengan alur yang sederhana.

# Features
1. Halaman Daftar Produk
2. Halaman Detail Produk
3. Halaman Favorite
4. Halaman Keranjang
5. Halaman Invoice Pembelian
6. Halaman Nota Pembelian

# Folder Structure
lib/
├── consts/
│   ├── colors.dart           # Definisi warna-warna yang digunakan di seluruh aplikasi
│   ├── consts.dart           # Konstanta umum
│   ├── images.dart           # Path atau referensi gambar-gambar yang digunakan
│   ├── strings.dart          # String literal (seperti teks label, judul, dll)
│   └── styles.dart           # Gaya teks dan tema aplikasi
│
├── providers/
│   ├── cart_provider.dart            # Provider untuk mengelola state keranjang
│   └── favorite_provider.dart        # Provider untuk mengelola state item favorit
│
├── screens/
│   ├── cart_screen.dart              # Tampilan layar keranjang belanja
│   ├── favorites_screen.dart        # Tampilan layar daftar favorit
│   ├── invoice_screen.dart          # Tampilan layar invoice atau faktur
│   ├── product_detail_screen.dart   # Tampilan detail produk
│   ├── product_list_screen.dart     # Tampilan daftar semua produk
│   ├── product_screen.dart          # Tampilan utama produk
│   └── receipt_screen.dart          # Tampilan layar struk pembelian
│
└── main.dart                         # Entry point dari aplikasi Flutter

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
