import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:islamic_app/core/errors_exceptions/exceptions.dart';
import 'package:islamic_app/core/helpers/cache_helper.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/quran/domain/entities/page.dart';

import '../../../surah/data/models/surah_model.dart';
import '../models/juz_model.dart';
import '../models/page_model.dart';

abstract class QuranLocalDatasource {
  Future<(Pagination, List<SurahModel>)> getSurahs(int pageNumber);
  Future<(Pagination, List<JuzModel>)> getJuzs(int pageNumber);
  Future<(Pagination, List<Page>)> getPages(int pageNumber);
}

class QuranLocalDatasourceImpl implements QuranLocalDatasource {
  final CacheHelper cacheHelper;

  QuranLocalDatasourceImpl({required this.cacheHelper});

  @override
  Future<(Pagination, List<SurahModel>)> getSurahs(int pageNumber) async {
    // try {
    const pageSize = 10;
    final surahs = await rootBundle.loadString('assets/quran/quranV2.json');
    final List<Map<String, dynamic>> surahsList = List<Map<String, dynamic>>.from(json.decode(surahs));
    List<Map<String, dynamic>> getPaginatedData() {
      int startIndex = (pageNumber - 1) * pageSize;
      int endIndex = min(pageNumber * pageSize, surahsList.length);
      if (startIndex >= surahsList.length) return surahsList;
      return surahsList.sublist(startIndex, endIndex);
    }

    final pagination = Pagination(currentPage: pageNumber, pageSize: pageSize, totalPages: (surahsList.length / pageSize).ceil());
    final surahsModels = getPaginatedData().map((e) => SurahModel.fromMap(e)).toList();

    return (pagination, surahsModels);
    // } catch (e) {

    //   // throw UnhandledCodeException(message: e.toString());
    // }
  }

  @override
  Future<(Pagination, List<JuzModel>)> getJuzs(int pageNumber) async {
    try {
      const pageSize = 10;
      final juzs = await rootBundle.loadString('assets/quran/juz.json');
      final List<Map<String, dynamic>> juzsList = List<Map<String, dynamic>>.from(json.decode(juzs));
      List<Map<String, dynamic>> getPaginatedData() {
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = min(pageNumber * pageSize, juzsList.length);
        if (startIndex >= juzsList.length) return juzsList;
        return juzsList.sublist(startIndex, endIndex);
      }

      final pagination = Pagination(currentPage: pageNumber, pageSize: pageSize, totalPages: (juzsList.length / pageSize).ceil());
      final juzsModels = getPaginatedData().map((e) => JuzModel.fromMap(e)).toList();

      return (pagination, juzsModels);
    } catch (e) {
      throw UnhandledCodeException(message: e.toString());
    }
  }

  @override
  Future<(Pagination, List<Page>)> getPages(int pageNumber) async {
    try {
      const pageSize = 10;
      final pages = await rootBundle.loadString('assets/quran/page.json');
      final List<Map<String, dynamic>> pagesList = List<Map<String, dynamic>>.from(json.decode(pages));
      List<Map<String, dynamic>> getPaginatedData() {
        int startIndex = (pageNumber - 1) * pageSize;
        int endIndex = min(pageNumber * pageSize, pagesList.length);
        if (startIndex >= pagesList.length) return pagesList;
        return pagesList.sublist(startIndex, endIndex);
      }

      final pagination = Pagination(currentPage: pageNumber, pageSize: pageSize, totalPages: (pagesList.length / pageSize).ceil());
      final pagesModels = getPaginatedData().map((e) => PageModel.fromMap(e)).toList();

      return (pagination, pagesModels);
    } catch (e) {
      throw UnhandledCodeException(message: e.toString());
    }
  }
}
