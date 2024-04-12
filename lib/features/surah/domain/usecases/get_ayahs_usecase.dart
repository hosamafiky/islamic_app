import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/surah/domain/entities/ayah.dart';
import 'package:islamic_app/features/surah/domain/entities/surah.dart';
import 'package:islamic_app/features/surah/domain/repositories/surah_repository.dart';

import '../../../../core/models/pagination.dart';

class GetAyahsUsecase {
  final SurahRepository repository;

  GetAyahsUsecase(this.repository);

  Future<Either<AppError, List<Ayah>>> call(Surah surah, {Pagination pagination = const Pagination()}) async {
    return await repository.getSurahAyahs(surah, pagination: pagination);
  }
}
