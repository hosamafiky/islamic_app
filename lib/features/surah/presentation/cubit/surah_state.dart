part of 'surah_cubit.dart';

abstract class SurahState extends Equatable {
  const SurahState({
    this.ayahs = const <Ayah>[],
    this.pagination = const Pagination(),
    this.error,
  });

  final List<Ayah> ayahs;
  final Pagination pagination;
  final AppError? error;

  @override
  List<Object?> get props => [ayahs, error, pagination];
}

class SurahInitial extends SurahState {
  const SurahInitial();
}

class AyahsLoaded extends SurahState {
  const AyahsLoaded({
    required List<Ayah> ayahs,
    required Pagination pagination,
  }) : super(ayahs: ayahs, pagination: pagination);
}

class AyahsError extends SurahState {
  const AyahsError({
    required AppError error,
    required Pagination pagination,
  }) : super(error: error, pagination: pagination);
}

class AyahsLoading extends SurahState {
  const AyahsLoading({required super.pagination, required super.ayahs});
}
