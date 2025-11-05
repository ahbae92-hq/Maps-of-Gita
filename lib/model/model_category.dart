import 'package:flutter/material.dart';

class ModelCategory {
  String? strName;       // Nama kategori (misal: Senilai)
  IconData? strIcon;     // Ikon yang ditampilkan di kartu kategori
  Color? strColor;       // Warna tema untuk kategori
  String? strDesc;       // Deskripsi singkat kategori
  int? questCount;       // Jumlah soal di kategori ini

  ModelCategory({
    required this.strName,
    required this.strIcon,
    required this.strColor,
    required this.strDesc,
    required this.questCount,
  });
}
