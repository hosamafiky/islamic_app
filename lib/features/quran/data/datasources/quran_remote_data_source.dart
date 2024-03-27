import 'package:dio/dio.dart';
import 'package:islamic_app/core/errors_exceptions/exceptions.dart';
import 'package:islamic_app/core/helpers/dio_helper.dart';
import 'package:islamic_app/features/quran/data/models/juz_model.dart';
import 'package:islamic_app/features/surah/data/models/surah_model.dart';

abstract class QuranRemoteDatasource {
  Future<List<SurahModel>> getSurahs();
  Future<List<JuzModel>> getJuzs();
}

class QuranRemoteDatasourceImpl implements QuranRemoteDatasource {
  final DioHelper dioHelper;

  QuranRemoteDatasourceImpl({required this.dioHelper});

  @override
  Future<List<SurahModel>> getSurahs() async {
    try {
      final response = await dioHelper.getData(url: 'surah');
      return List<SurahModel>.from(response.data['data'].map((e) => SurahModel.fromMap(e)));
    } on DioException catch (e) {
      throw ServerException(message: e.response!.statusMessage!);
    } catch (e) {
      throw UnhandledCodeException(message: e.toString());
    }
  }

  @override
  Future<List<JuzModel>> getJuzs() async {
    try {
      final response = await dioHelper.getData(url: 'juzs');
      return List<JuzModel>.from(response.data['juzs'].map((e) => JuzModel.fromMap(e)));
    } on DioException catch (e) {
      throw ServerException(message: e.response!.statusMessage!);
    } catch (e) {
      throw UnhandledCodeException(message: e.toString());
    }
  }
}
