import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:islamic_app/core/errors_exceptions/exceptions.dart';
import 'package:islamic_app/core/helpers/cache_helper.dart';
import 'package:islamic_app/features/quran/domain/entities/page.dart';

import '../models/juz_model.dart';
import '../models/page_model.dart';
import '../models/surah_model.dart';

abstract class QuranLocalDatasource {
  Future<List<SurahModel>> getSurahs();
  Future<List<JuzModel>> getJuzs();
  Future<List<Page>> getPages();
}

class QuranLocalDatasourceImpl implements QuranLocalDatasource {
  final CacheHelper cacheHelper;

  QuranLocalDatasourceImpl({required this.cacheHelper});

  @override
  Future<List<SurahModel>> getSurahs() async {
    try {
      final surahs = await rootBundle.loadString('assets/quran/surah.json');
      final List<Map<String, dynamic>> surahsList = List<Map<String, dynamic>>.from(json.decode(surahs));
      return surahsList.map((e) => SurahModel.fromMap(e)).toList();
    } catch (e) {
      throw UnhandledCodeException(message: e.toString());
    }
  }

  @override
  Future<List<JuzModel>> getJuzs() async {
    try {
      final juzs = await rootBundle.loadString('assets/quran/juz.json');
      final List<Map<String, dynamic>> juzsList = List<Map<String, dynamic>>.from(json.decode(juzs));
      return juzsList.map((e) => JuzModel.fromMap(e)).toList();
    } catch (e) {
      throw UnhandledCodeException(message: e.toString());
    }
  }

  @override
  Future<List<Page>> getPages() async {
    try {
      final pages = await rootBundle.loadString('assets/quran/page.json');
      final List<Map<String, dynamic>> pagesList = List<Map<String, dynamic>>.from(json.decode(pages));
      return pagesList.map((e) => PageModel.fromMap(e)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
