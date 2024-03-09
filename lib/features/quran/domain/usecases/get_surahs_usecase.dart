import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/quran/domain/repositories/quran_repository.dart';

import '../entities/surah.dart';

class GetSurahsUsecase {
  final QuranRepository repository;

  GetSurahsUsecase(this.repository);

  Future<Either<AppError, List<Surah>>> call() async {
    return await repository.getSurahs();
  }
}
