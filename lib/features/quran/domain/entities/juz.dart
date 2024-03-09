// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Juz extends Equatable {
  final String index;
  final JuzPart start;
  final JuzPart end;

  const Juz({
    required this.index,
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toMap() => {
        'index': index,
        'start': start.toMap(),
        'end': end.toMap(),
      };

  String toJson() => jsonEncode(toMap());

  @override
  List<Object> get props => [index, start, end];
}

class JuzPart extends Equatable {
  final String index;
  final String verse;
  final String name;

  const JuzPart({
    required this.index,
    required this.verse,
    required this.name,
  });

  Map<String, dynamic> toMap() => {
        'index': index,
        'verse': {},
      };

  String toJson() => jsonEncode(toMap());

  @override
  List<Object> get props => [index, verse, name];
}
