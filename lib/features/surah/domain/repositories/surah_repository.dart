import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';

abstract class SurahRepository {
  Future<Either<AppError, (Pagination, List<Verse>)>> getSurahAyahs(Surah surah, int pageNumber);
  Future<Either<AppError, String>> getSurahAyahAudio(int surahIndex, int ayahIndex);
}
