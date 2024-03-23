import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/quran/domain/entities/juz.dart';
import 'package:islamic_app/features/quran/domain/entities/page.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';

abstract class QuranRepository {
  Future<Either<AppError, List<Surah>>> getSurahs();
  Future<Either<AppError, List<Juz>>> getJuzs();
  Future<Either<AppError, List<Page>>> getPages();
}
