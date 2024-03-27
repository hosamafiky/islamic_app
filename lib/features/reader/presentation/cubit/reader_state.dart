part of 'reader_cubit.dart';

abstract class ReaderState extends Equatable {
  const ReaderState({
    this.readers = const <Reader>[],
    this.selectedReader,
    this.error,
  });

  final List<Reader> readers;
  final Reader? selectedReader;
  final AppError? error;

  @override
  List<Object?> get props => [readers, selectedReader, error];
}

class ReaderInitial extends ReaderState {}

class ReadersLoaded extends ReaderState {
  const ReadersLoaded({
    required List<Reader> readers,
  }) : super(readers: readers);
}

class ReadersError extends ReaderState {
  const ReadersError({
    required AppError error,
  }) : super(error: error);
}

class ReaderSelected extends ReaderState {
  const ReaderSelected({
    required Reader reader,
    required List<Reader> readers,
  }) : super(selectedReader: reader, readers: readers);
}
