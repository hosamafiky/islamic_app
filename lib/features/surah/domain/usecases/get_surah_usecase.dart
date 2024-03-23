import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/surah/domain/repositories/surah_repository.dart';

import '../../../quran/domain/entities/surah.dart';

class GetSurahUsecase {
  final SurahRepository repository;

  GetSurahUsecase(this.repository);

  Future<Either<AppError, Surah>> call(Surah surah, int pageNumber) async {
    return await repository.getSurah(surah, pageNumber);
  }
}
