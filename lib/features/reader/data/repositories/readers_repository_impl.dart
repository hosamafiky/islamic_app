import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/errors_exceptions/exceptions.dart';
import 'package:islamic_app/features/reader/data/datasources/reader_local_datasource.dart';
import 'package:islamic_app/features/reader/domain/entities/reader.dart';
import 'package:islamic_app/features/reader/domain/repositories/readers_repository.dart';

class ReadersRepositoryImpl implements ReadersRepository {
  final ReaderLocalDatasource _readersDataSource;

  ReadersRepositoryImpl(this._readersDataSource);

  @override
  Future<Either<AppError, List<Reader>>> getReaders() async {
    try {
      final readers = await _readersDataSource.getReaders();
      return Right(readers);
    } on UnhandledCodeException catch (e) {
      return Left(UnhandledError(message: e.toString()));
    }
  }
}
