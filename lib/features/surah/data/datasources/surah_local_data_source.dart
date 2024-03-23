import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:islamic_app/features/quran/data/models/surah_model.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';

import '../../../../core/errors_exceptions/exceptions.dart';

abstract class SurahLocalDatasource {
  Future<SurahModel> getSurah(Surah surah, int pageNumber);
}

class SurahLocalDatasourceImpl implements SurahLocalDatasource {
  @override
  Future<SurahModel> getSurah(Surah surah, int pageNumber) async {
    try {
      final number = int.parse(surah.index);
      final surahDetails = await rootBundle.loadString('assets/quran/surahs/surah_$number.json');
      final data = json.decode(surahDetails)['verse'].entries.toList();
      List<MapEntry<String, dynamic>> getPaginatedData(int currentPage) {
        int startIndex = (currentPage - 1) * 10;
        int endIndex = min(currentPage * 10, data.length);
        if (startIndex >= data.length) return data;
        return data.sublist(startIndex, endIndex);
      }

      // int totalPages = (data.length / 10).ceil();
      final verses = List<VerseModel>.from(getPaginatedData(pageNumber).map((e) => VerseModel.fromEntry(e)));
      final newSurah = surah.copyWith(verses: verses).toModel();
      return newSurah;
    } catch (e) {
      print(e);
      throw UnhandledCodeException(message: e.toString());
    }
  }
}
