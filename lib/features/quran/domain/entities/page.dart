// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Page extends Equatable {
  final String index;
  final PageStart start;
  final PageEnd end;

  const Page({
    required this.index,
    required this.start,
    required this.end,
  });

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'start': start.toMap(),
      'end': end.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props => [index, start, end];
}

class PageStart extends Equatable {
  final String index;
  final String verse;
  final String name;
  final String nameAr;

  const PageStart({
    required this.index,
    required this.verse,
    required this.name,
    required this.nameAr,
  });

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'verse': verse,
      'name': name,
      'nameAr': nameAr,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props => [index, verse, name, nameAr];
}

class PageEnd extends Equatable {
  final String index;
  final String verse;
  final String name;
  final String nameAr;

  const PageEnd({
    required this.index,
    required this.verse,
    required this.name,
    required this.nameAr,
  });

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'verse': verse,
      'name': name,
      'nameAr': nameAr,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object> get props => [index, verse, name, nameAr];
}
