import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/reader/domain/usecases/get_readers_usecase.dart';

import '../../domain/entities/reader.dart';

part 'reader_state.dart';

class ReaderCubit extends Cubit<ReaderState> {
  ReaderCubit({
    required this.getReadersUsecase,
  }) : super(ReaderInitial());

  final GetReadersUsecase getReadersUsecase;

  Future<void> getReaders() async {
    final readers = await getReadersUsecase();
    readers.fold(
      (error) => emit(ReadersError(error: error)),
      (readers) => emit(ReadersLoaded(readers: readers)),
    );
  }

  void selectReader(Reader reader) {
    emit(ReaderSelected(reader: reader, readers: state.readers));
  }
}
