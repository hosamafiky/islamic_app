import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/errors_exceptions/exceptions.dart';
import 'package:islamic_app/features/surah/domain/entities/ayah.dart';
import 'package:islamic_app/features/surah/domain/entities/surah.dart';
import 'package:islamic_app/features/surah/domain/repositories/surah_repository.dart';

import '../../../../core/models/pagination.dart';
import '../datasources/surah_local_data_source.dart';
import '../datasources/surah_remote_data_source.dart';

class SurahRepositoryImpl implements SurahRepository {
  SurahRepositoryImpl({
    required this.surahLocalDatasource,
    required this.surahRemoteDatasource,
  });

  final SurahLocalDatasource surahLocalDatasource;
  final SurahRemoteDatasource surahRemoteDatasource;

  @override
  Future<Either<AppError, String>> getSurahAyahAudio(int surahIndex, int ayahIndex) async {
    try {
      final audio = await surahRemoteDatasource.getSurahAyahAudio(surahIndex, ayahIndex);
      return Right(audio);
    } on ServerException catch (excep) {
      return Left(ServerError(message: excep.message));
    } on UnhandledCodeException catch (excep) {
      return Left(UnhandledError(message: excep.message));
    }
  }

  @override
  Future<Either<AppError, List<Ayah>>> getSurahAyahs(Surah surah, {Pagination pagination = const Pagination()}) async {
    try {
      final ayahs = await surahLocalDatasource.getAyahs(surah, pagination: pagination);
      return Right(ayahs);
    } on UnhandledCodeException catch (excep) {
      return Left(UnhandledError(message: excep.message));
    }
  }
}
