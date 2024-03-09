import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';

import '../entities/juz.dart';
import '../repositories/quran_repository.dart';

class GetJuzsUsecase {
  final QuranRepository repository;

  GetJuzsUsecase(this.repository);

  Future<Either<AppError, List<Juz>>> call() async {
    return await repository.getJuzs();
  }
}
