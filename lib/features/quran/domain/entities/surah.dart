// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:islamic_app/features/quran/data/models/surah_model.dart';

class Surah extends Equatable {
  final String place;
  final String type;
  final int count;
  final int revelationOrder;
  final int rukus;
  final String title;
  final String titleAr;
  final String titleEn;
  final String index;
  final String pages;
  final String page;
  final int start;
  final List<IncludedJuzPart> juz;
  final List<Verse> verses;

  const Surah({
    required this.place,
    required this.type,
    required this.count,
    required this.revelationOrder,
    required this.rukus,
    required this.title,
    required this.titleAr,
    required this.titleEn,
    required this.index,
    required this.pages,
    required this.page,
    required this.start,
    required this.juz,
    this.verses = const [],
  });

  Surah copyWith({
    String? place,
    String? type,
    int? count,
    int? revelationOrder,
    int? rukus,
    String? title,
    String? titleAr,
    String? titleEn,
    String? index,
    String? pages,
    String? page,
    int? start,
    List<IncludedJuzPart>? juz,
    List<Verse>? verses,
  }) {
    return Surah(
      place: place ?? this.place,
      type: type ?? this.type,
      count: count ?? this.count,
      revelationOrder: revelationOrder ?? this.revelationOrder,
      rukus: rukus ?? this.rukus,
      title: title ?? this.title,
      titleAr: titleAr ?? this.titleAr,
      titleEn: titleEn ?? this.titleEn,
      index: index ?? this.index,
      pages: pages ?? this.pages,
      page: page ?? this.page,
      start: start ?? this.start,
      juz: juz ?? this.juz,
      verses: verses ?? this.verses,
    );
  }

  SurahModel toModel() => SurahModel(
        place: place,
        type: type,
        count: count,
        revelationOrder: revelationOrder,
        rukus: rukus,
        title: title,
        titleAr: titleAr,
        titleEn: titleEn,
        index: index,
        pages: pages,
        page: page,
        start: start,
        juz: juz,
        verses: verses,
      );

  Map<String, dynamic> toMap() {
    return {
      'place': place,
      'type': type,
      'count': count,
      'revelationOrder': revelationOrder,
      'rukus': rukus,
      'title': title,
      'titleAr': titleAr,
      'titleEn': titleEn,
      'index': index,
      'pages': pages,
      'page': page,
      'start': start,
      'juz': juz.map((x) => x.toMap()).toList(),
      'verses': verses.map((e) => e.toEntry()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props {
    return [
      place,
      type,
      count,
      revelationOrder,
      rukus,
      title,
      titleAr,
      titleEn,
      index,
      pages,
      page,
      start,
      juz,
      verses,
    ];
  }
}

class IncludedJuzPart extends Equatable {
  final String index;
  final VerseRange verse;

  const IncludedJuzPart({
    required this.index,
    required this.verse,
  });

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'verse': verse,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props {
    return [index, verse];
  }
}

class VerseRange {
  final String start;
  final String end;

  VerseRange({
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toMap() {
    return {
      'start': start,
      'end': end,
    };
  }

  String toJson() => json.encode(toMap());
}

class Verse {
  final int number;
  final String key;
  final String audioUrl;
  final String text;

  const Verse({
    required this.number,
    required this.key,
    required this.audioUrl,
    required this.text,
  });

  Verse copyWith({
    int? number,
    String? key,
    String? audioUrl,
    String? text,
  }) {
    return Verse(
      number: number ?? this.number,
      key: key ?? this.key,
      audioUrl: audioUrl ?? this.audioUrl,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toEntry() => {key: text};

  String toJson() => json.encode(toEntry());
}
