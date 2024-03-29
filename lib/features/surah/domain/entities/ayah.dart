// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Ayah extends Equatable {
  final int number;
  String audio;
  final List<String> audioSecondary;
  final String text;
  final String ayaTextEmlaey;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int pageInSurah;
  final int ruku;
  final int hizbQuarter;
  final dynamic sajda;
  final String codeV2;

  Ayah({
    required this.number,
    required this.audio,
    required this.audioSecondary,
    required this.text,
    required this.ayaTextEmlaey,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.pageInSurah,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
    required this.codeV2,
  });

  Map<String, dynamic> toMap() => {
        "number": number,
        "audio": audio,
        "audioSecondary": audioSecondary,
        "text": text,
        "aya_text_emlaey": ayaTextEmlaey,
        "numberInSurah": numberInSurah,
        "juz": juz,
        "manzil": manzil,
        "page": page,
        "pageInSurah": pageInSurah,
        "ruku": ruku,
        "hizbQuarter": hizbQuarter,
        "sajda": sajda,
        "code_v2": codeV2,
      };

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props {
    return [
      number,
      audio,
      audioSecondary,
      text,
      ayaTextEmlaey,
      numberInSurah,
      juz,
      manzil,
      page,
      pageInSurah,
      ruku,
      hizbQuarter,
      sajda,
      codeV2,
    ];
  }
}
