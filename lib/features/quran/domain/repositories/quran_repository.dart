import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/quran/domain/entities/juz.dart';
import 'package:islamic_app/features/quran/domain/entities/page.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';

abstract class QuranRepository {
  Future<Either<AppError, (Pagination, List<Surah>)>> getSurahs(int pageNumber);
  Future<Either<AppError, (Pagination, List<Juz>)>> getJuzs(int pageNumber);
  Future<Either<AppError, (Pagination, List<Page>)>> getPages(int pageNumber);
}
