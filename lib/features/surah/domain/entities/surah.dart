// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:islamic_app/features/surah/domain/entities/ayah.dart';

class Surah extends Equatable {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final List<Ayah> ayahs;

  const Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  Map<String, dynamic> toMap() => {
        "number": number,
        "name": name,
        "englishName": englishName,
        "englishNameTranslation": englishNameTranslation,
        "revelationType": revelationType,
        "ayahs": ayahs.map((ayah) => ayah.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props {
    return [
      number,
      name,
      englishName,
      englishNameTranslation,
      revelationType,
      ayahs,
    ];
  }
}
