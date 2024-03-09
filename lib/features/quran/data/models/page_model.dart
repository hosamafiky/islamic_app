import 'dart:convert';

import '../../domain/entities/page.dart';

class PageModel extends Page {
  const PageModel({
    required super.start,
    required super.end,
    required super.index,
  });

  factory PageModel.fromMap(Map<String, dynamic> json) {
    return PageModel(
      index: json['index'],
      start: PageStartModel.fromMap(json['start']),
      end: PageEndModel.fromMap(json['end']),
    );
  }

  factory PageModel.fromJson(String source) {
    return PageModel.fromMap(json.decode(source));
  }
}

class PageStartModel extends PageStart {
  const PageStartModel({
    required super.index,
    required super.name,
    required super.nameAr,
    required super.verse,
  });

  factory PageStartModel.fromMap(Map<String, dynamic> json) {
    return PageStartModel(
      index: json['index'],
      verse: json['verse'],
      name: json['name'],
      nameAr: json['nameAr'],
    );
  }

  factory PageStartModel.fromJson(String source) {
    return PageStartModel.fromMap(json.decode(source));
  }
}

class PageEndModel extends PageEnd {
  const PageEndModel({
    required super.index,
    required super.name,
    required super.nameAr,
    required super.verse,
  });

  factory PageEndModel.fromMap(Map<String, dynamic> json) {
    return PageEndModel(
      index: json['index'],
      verse: json['verse'],
      name: json['name'],
      nameAr: json['nameAr'],
    );
  }

  factory PageEndModel.fromJson(String source) {
    return PageEndModel.fromMap(json.decode(source));
  }
}
