part of 'quran_cubit.dart';

abstract class QuranState extends Equatable {
  const QuranState({
    this.surahs = const <Surah>[],
    this.juzs = const <Juz>[],
    this.pages = const <Page>[],
    this.error,
  });

  final List<Surah> surahs;
  final List<Juz> juzs;
  final List<Page> pages;
  final AppError? error;

  @override
  String toString() {
    return 'QuranState(surahs: $surahs, juzs: $juzs, pages: $pages, error: $error)';
  }

  @override
  List<Object?> get props => [surahs, juzs, pages, error];
}

class QuranInitial extends QuranState {}

class SurahsLoaded extends QuranState {
  const SurahsLoaded({required super.surahs, super.juzs = const <Juz>[], super.pages = const <Page>[]});
}

class SurahsError extends QuranState {
  const SurahsError({required super.error, super.juzs = const <Juz>[], super.pages = const <Page>[]});
}

class SurahsLoading extends QuranState {
  const SurahsLoading({super.juzs = const <Juz>[], super.pages = const <Page>[]});
}

class JuzsLoaded extends QuranState {
  const JuzsLoaded({required super.juzs, super.surahs = const <Surah>[], super.pages = const <Page>[]});
}

class JuzsError extends QuranState {
  const JuzsError({required super.error, super.surahs = const <Surah>[], super.pages = const <Page>[]});
}

class JuzsLoading extends QuranState {
  const JuzsLoading({super.surahs = const <Surah>[], super.pages = const <Page>[]});
}

class PagesLoading extends QuranState {
  const PagesLoading({super.surahs = const <Surah>[], super.juzs = const <Juz>[], super.error});
}

class PagesLoaded extends QuranState {
  const PagesLoaded({required super.surahs, required super.juzs, super.error, required super.pages});
}

class PagesError extends QuranState {
  const PagesError({required super.error, super.surahs = const <Surah>[], super.juzs = const <Juz>[]});
}
