import 'dart:convert';

import 'package:equatable/equatable.dart';

class Reader extends Equatable {
  final String identifier;
  final String name;
  final String englishName;

  const Reader({
    required this.identifier,
    required this.name,
    required this.englishName,
  });

  Map<String, dynamic> toMap() {
    return {
      'identifier': identifier,
      'name': name,
      'englishName': englishName,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props => [identifier, name, englishName];
}
