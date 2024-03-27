import 'dart:convert';

import 'package:islamic_app/features/surah/data/models/ayah_model.dart';
import 'package:islamic_app/features/surah/domain/entities/surah.dart';

class SurahModel extends Surah {
  const SurahModel({
    required super.number,
    required super.name,
    required super.englishName,
    required super.englishNameTranslation,
    required super.revelationType,
    required super.ayahs,
  });

  factory SurahModel.fromMap(Map<String, dynamic> map) {
    return SurahModel(
      number: map['number'],
      name: map['name'],
      englishName: map['englishName'],
      englishNameTranslation: map['englishNameTranslation'],
      revelationType: map['revelationType'],
      ayahs: List<AyahModel>.from(map['ayahs'].map((x) => AyahModel.fromMap(x))),
    );
  }

  factory SurahModel.fromJson(String source) => SurahModel.fromMap(json.decode(source));
}
