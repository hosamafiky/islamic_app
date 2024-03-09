import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';

import '../entities/surah.dart';
import '../repositories/quran_repository.dart';

class GetSurahUsecase {
  final QuranRepository repository;

  GetSurahUsecase(this.repository);

  Future<Either<AppError, Surah>> call(Surah surah) async {
    return await repository.getSurah(surah);
  }
}
