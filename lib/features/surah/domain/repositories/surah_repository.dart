import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';

abstract class SurahRepository {
  Future<Either<AppError, String>> getSurahAyahAudio(int surahIndex, int ayahIndex);
}
