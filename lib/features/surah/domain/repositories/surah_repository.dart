import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';

abstract class SurahRepository {
  Future<Either<AppError, Surah>> getSurah(Surah surah, int pageNumber);
}
