part of 'surah_cubit.dart';

abstract class SurahState extends Equatable {
  const SurahState({
    this.ayahs = const <Verse>[],
    this.error,
  });

  final List<Verse> ayahs;
  final AppError? error;

  @override
  List<Object?> get props => [ayahs, error];
}

class SurahInitial extends SurahState {
  const SurahInitial();
}

class AyahsLoaded extends SurahState {
  const AyahsLoaded({
    required List<Verse> ayahs,
  }) : super(ayahs: ayahs);
}

class AyahsError extends SurahState {
  const AyahsError({
    required AppError error,
  }) : super(error: error);
}

class AyahsLoading extends SurahState {
  const AyahsLoading();
}
