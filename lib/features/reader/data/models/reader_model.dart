import 'dart:convert';

import 'package:islamic_app/features/reader/domain/entities/reader.dart';

class ReaderModel extends Reader {
  const ReaderModel({
    required super.identifier,
    required super.name,
    required super.englishName,
  });

  factory ReaderModel.fromMap(Map<String, dynamic> map) {
    return ReaderModel(
      identifier: map['identifier'],
      name: map['name'],
      englishName: map['englishName'],
    );
  }

  factory ReaderModel.fromJson(String source) => ReaderModel.fromMap(json.decode(source));
}
