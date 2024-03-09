import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/quran/domain/entities/page.dart';

import '../repositories/quran_repository.dart';

class GetPagesUsecase {
  final QuranRepository repository;

  GetPagesUsecase(this.repository);

  Future<Either<AppError, List<Page>>> call() async {
    return await repository.getPages();
  }
}
