import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/quran/domain/entities/page.dart';

import '../repositories/quran_repository.dart';

class GetPagesUsecase {
  final QuranRepository repository;

  GetPagesUsecase(this.repository);

  Future<Either<AppError, (Pagination, List<Page>)>> call(int pageNumber) async {
    return await repository.getPages(pageNumber);
  }
}
