import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/reader/domain/entities/reader.dart';

abstract class ReadersRepository {
  Future<Either<AppError, List<Reader>>> getReaders();
}
