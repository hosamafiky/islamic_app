import 'dart:convert';

import 'package:islamic_app/features/quran/domain/entities/surah.dart';

class SurahModel extends Surah {
  const SurahModel({
    required super.place,
    required super.type,
    required super.count,
    required super.revelationOrder,
    required super.rukus,
    required super.title,
    required super.titleAr,
    required super.titleEn,
    required super.index,
    required super.pages,
    required super.page,
    required super.start,
    required super.juz,
    required super.verses,
  });

  factory SurahModel.fromMap(Map<String, dynamic> json) {
    return SurahModel(
      place: json['place'],
      type: json['type'],
      count: json['count'],
      revelationOrder: json['revelationOrder'],
      rukus: json['rukus'],
      title: json['title'],
      titleAr: json['titleAr'],
      titleEn: json['titleEn'],
      index: json['index'],
      pages: json['pages'],
      page: json['page'],
      start: json['start'],
      juz: List<IncludedJuzPartModel>.from(json['juz'].map((e) => IncludedJuzPartModel.fromMap(e)).toList()),
      verses: List<VerseModel>.from((json['verses'] ?? {}).entries.map((e) => VerseModel.fromEntry(e)).toList()),
    );
  }

  factory SurahModel.fromJson(String json) {
    return SurahModel.fromMap(jsonDecode(json));
  }
}

class IncludedJuzPartModel extends IncludedJuzPart {
  const IncludedJuzPartModel({
    required super.index,
    required super.verse,
  });

  factory IncludedJuzPartModel.fromMap(Map<String, dynamic> json) {
    return IncludedJuzPartModel(
      index: json['index'],
      verse: VerseRangeModel.fromMap(json['verse']),
    );
  }

  factory IncludedJuzPartModel.fromJson(String json) {
    return IncludedJuzPartModel.fromMap(jsonDecode(json));
  }
}

class VerseRangeModel extends VerseRange {
  VerseRangeModel({
    required super.start,
    required super.end,
  });

  factory VerseRangeModel.fromMap(Map<String, dynamic> json) {
    return VerseRangeModel(
      start: json['start'],
      end: json['end'],
    );
  }

  factory VerseRangeModel.fromJson(String json) {
    return VerseRangeModel.fromMap(jsonDecode(json));
  }
}

class VerseModel extends Verse {
  const VerseModel({
    required super.key,
    required super.text,
  });

  factory VerseModel.fromEntry(MapEntry<String, dynamic> entry) {
    return VerseModel(
      key: entry.key,
      text: entry.value,
    );
  }

  factory VerseModel.fromJson(String json) {
    return VerseModel.fromEntry(jsonDecode(json));
  }
}
