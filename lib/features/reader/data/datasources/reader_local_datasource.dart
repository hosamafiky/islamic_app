import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islamic_app/core/errors_exceptions/exceptions.dart';
import 'package:islamic_app/features/reader/data/models/reader_model.dart';

abstract class ReaderLocalDatasource {
  Future<List<ReaderModel>> getReaders();
}

class ReaderLocalDatasourceImpl implements ReaderLocalDatasource {
  @override
  Future<List<ReaderModel>> getReaders() async {
    try {
      final stringData = await rootBundle.loadString('assets/quran/readers.json');
      final data = List<Map<String, dynamic>>.from(json.decode(stringData));
      return List<ReaderModel>.from(data.map((e) => ReaderModel.fromMap(e)));
    } catch (e) {
      throw UnhandledCodeException(message: e.toString());
    }
  }
}
