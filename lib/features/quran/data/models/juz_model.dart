import 'dart:convert';

import 'package:islamic_app/features/quran/domain/entities/juz.dart';

class JuzModel extends Juz {
  const JuzModel({
    required super.index,
    required super.start,
    required super.end,
  });

  factory JuzModel.fromMap(Map<String, dynamic> json) {
    return JuzModel(
      index: json['index'],
      start: JuzPartModel.fromMap(json['start']),
      end: JuzPartModel.fromMap(json['end']),
    );
  }

  factory JuzModel.fromJson(String json) {
    return JuzModel.fromMap(jsonDecode(json));
  }
}

class JuzPartModel extends JuzPart {
  const JuzPartModel({
    required super.index,
    required super.verse,
    required super.name,
  });

  factory JuzPartModel.fromMap(Map<String, dynamic> json) {
    return JuzPartModel(
      index: json['index'],
      verse: json['verse'],
      name: json['name'],
    );
  }

  factory JuzPartModel.fromJson(String json) {
    return JuzPartModel.fromMap(jsonDecode(json));
  }
}
