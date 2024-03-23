import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/quran/data/datasources/quran_local_data_source.dart';
import 'package:islamic_app/features/quran/data/datasources/quran_remote_data_source.dart';
import 'package:islamic_app/features/quran/domain/entities/juz.dart';
import 'package:islamic_app/features/quran/domain/entities/page.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';

import '../../../../core/errors_exceptions/exceptions.dart';
import '../../domain/repositories/quran_repository.dart';

class QuranRepositoryImpl implements QuranRepository {
  final InternetConnectionChecker checker;
  final QuranLocalDatasource quranLocalDataSource;
  final QuranRemoteDatasource quranRemoteDataSource;

  const QuranRepositoryImpl({
    required this.checker,
    required this.quranLocalDataSource,
    required this.quranRemoteDataSource,
  });

  @override
  Future<Either<AppError, (Pagination, List<Surah>)>> getSurahs(int pageNumber) async {
    try {
      final surahs = await quranLocalDataSource.getSurahs(pageNumber);
      return Right(surahs);
    } on UnhandledCodeException catch (excep) {
      return Left(UnhandledError(message: excep.message));
    }
  }

  @override
  Future<Either<AppError, (Pagination, List<Juz>)>> getJuzs(int pageNumber) async {
    try {
      final juzs = await quranLocalDataSource.getJuzs(pageNumber);
      return Right(juzs);
    } on UnhandledCodeException catch (excep) {
      return Left(UnhandledError(message: excep.message));
    }
  }

  @override
  Future<Either<AppError, (Pagination, List<Page>)>> getPages(int pageNumber) async {
    try {
      final pages = await quranLocalDataSource.getPages(pageNumber);
      return Right(pages);
    } on UnhandledCodeException catch (excep) {
      return Left(UnhandledError(message: excep.message));
    }
  }
}
