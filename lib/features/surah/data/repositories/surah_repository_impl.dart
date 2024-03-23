import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/errors_exceptions/exceptions.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';
import 'package:islamic_app/features/surah/domain/repositories/surah_repository.dart';

import '../datasources/surah_local_data_source.dart';

class SurahRepositoryImpl implements SurahRepository {
  SurahRepositoryImpl({required this.surahLocalDatasource});

  final SurahLocalDatasource surahLocalDatasource;
  @override
  Future<Either<AppError, Surah>> getSurah(Surah surah, int pageNumber) async {
    try {
      final surahDetails = await surahLocalDatasource.getSurah(surah, pageNumber);
      return Right(surahDetails);
    } on UnhandledCodeException catch (excep) {
      return Left(UnhandledError(message: excep.message));
    }
  }
}
