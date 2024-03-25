import 'package:dio/dio.dart';
import 'package:islamic_app/core/errors_exceptions/exceptions.dart';
import 'package:islamic_app/core/helpers/dio_helper.dart';

abstract class SurahRemoteDatasource {
  Future<String> getSurahAyahAudio(int surahIndex, int ayahIndex);
}

class SurahRemoteDatasourceImpl implements SurahRemoteDatasource {
  final DioHelper dioHelper;

  SurahRemoteDatasourceImpl({required this.dioHelper});

  @override
  Future<String> getSurahAyahAudio(int surahIndex, int ayahIndex) async {
    try {
      final response = await dioHelper.getData(url: 'ayah/$surahIndex:$ayahIndex/ar.alafasy');
      return response.data['data']['audio'];
    } on DioException catch (exception) {
      throw ServerException(message: exception.message ?? 'Server Error');
    } catch (e) {
      throw UnhandledCodeException(message: e.toString());
    }
  }
}
