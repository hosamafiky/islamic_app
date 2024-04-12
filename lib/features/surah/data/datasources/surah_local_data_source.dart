import 'dart:math';

import 'package:islamic_app/core/errors_exceptions/exceptions.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/surah/domain/entities/ayah.dart';
import 'package:islamic_app/features/surah/domain/entities/surah.dart';

abstract class SurahLocalDatasource {
  Future<List<Ayah>> getAyahs(Surah surah, {Pagination pagination = const Pagination()});
}

class SurahLocalDatasourceImpl implements SurahLocalDatasource {
  @override
  Future<List<Ayah>> getAyahs(Surah surah, {Pagination pagination = const Pagination()}) {
    try {
      final data = surah.ayahs;
      final start = (pagination.currentPage - 1) * pagination.pageSize;
      final end = min(pagination.currentPage * pagination.pageSize, data.length);
      final desiredData = data.sublist(start, end);
      return Future.value(desiredData);
    } catch (e) {
      throw UnhandledCodeException(message: e.toString());
    }
  }
}
