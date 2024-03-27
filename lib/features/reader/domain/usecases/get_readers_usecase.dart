import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/reader/domain/entities/reader.dart';
import 'package:islamic_app/features/reader/domain/repositories/readers_repository.dart';

class GetReadersUsecase {
  final ReadersRepository _readersRepository;

  GetReadersUsecase(this._readersRepository);

  Future<Either<AppError, List<Reader>>> call() async {
    return await _readersRepository.getReaders();
  }
}
