import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/quran/data/models/surah_model.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';

import '../../../../core/errors_exceptions/exceptions.dart';

abstract class SurahLocalDatasource {
  Future<(Pagination, List<VerseModel>)> getSurahAyahs(Surah surah, int pageNumber);
}

class SurahLocalDatasourceImpl implements SurahLocalDatasource {
  @override
  Future<(Pagination, List<VerseModel>)> getSurahAyahs(Surah surah, int pageNumber) async {
    try {
      const pageSize = 10;
      final number = int.parse(surah.index);
      final surahDetails = await rootBundle.loadString('assets/quran/surahs/surah_$number.json');
      final data = json.decode(surahDetails)['verse'].entries.toList();
      data.removeWhere((element) => element.key == "verse_0");
      List<MapEntry<String, dynamic>> getPaginatedData(int currentPage) {
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = min(currentPage * pageSize, data.length);
        if (startIndex >= data.length) return data;
        return data.sublist(startIndex, endIndex);
      }

      final pagination = Pagination(currentPage: pageNumber, pageSize: pageSize, totalPages: (data.length / pageSize).ceil());
      final verses = List<VerseModel>.from(getPaginatedData(pageNumber).map((e) => VerseModel.fromEntry(e)));
      return (pagination, verses);
    } catch (e) {
      throw UnhandledCodeException(message: e.toString());
    }
  }
}
