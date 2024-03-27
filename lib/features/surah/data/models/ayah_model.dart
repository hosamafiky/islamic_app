import 'dart:convert';

import 'package:islamic_app/features/surah/domain/entities/ayah.dart';

class AyahModel extends Ayah {
  const AyahModel({
    required super.number,
    required super.audio,
    required super.audioSecondary,
    required super.text,
    required super.ayaTextEmlaey,
    required super.numberInSurah,
    required super.juz,
    required super.manzil,
    required super.page,
    required super.pageInSurah,
    required super.ruku,
    required super.hizbQuarter,
    required super.sajda,
    required super.codeV2,
  });

  factory AyahModel.fromMap(Map<String, dynamic> map) {
    return AyahModel(
      number: map['number'],
      audio: map['audio'],
      audioSecondary: List<String>.from(map['audioSecondary']),
      text: map['text'],
      ayaTextEmlaey: map['aya_text_emlaey'],
      numberInSurah: map['numberInSurah'],
      juz: map['juz'],
      manzil: map['manzil'],
      page: map['page'],
      pageInSurah: map['pageInSurah'],
      ruku: map['ruku'],
      hizbQuarter: map['hizbQuarter'],
      sajda: map['sajda'],
      codeV2: map['code_v2'],
    );
  }

  factory AyahModel.fromJson(String source) => AyahModel.fromMap(json.decode(source));
}
