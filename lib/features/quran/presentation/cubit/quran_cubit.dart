import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/extensions/either_ext.dart';
import 'package:islamic_app/features/quran/domain/entities/page.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_juzs_usecase.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_pages_usecase.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_surah_usecase.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_surahs_usecase.dart';

import '../../domain/entities/juz.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit({
    required this.getSurahsUsecase,
    required this.getJuzsUsecase,
    required this.getPagesUsecase,
    required this.getSurahUsecase,
  }) : super(QuranInitial());

  final GetSurahsUsecase getSurahsUsecase;
  final GetSurahUsecase getSurahUsecase;
  final GetJuzsUsecase getJuzsUsecase;
  final GetPagesUsecase getPagesUsecase;

  Future<void> getSurahs() async {
    emit(SurahsLoading(juzs: state.juzs, pages: state.pages));
    final result = await getSurahsUsecase();
    result.fold(
      (error) => emit(SurahsError(error: error, juzs: state.juzs, pages: state.pages)),
      (surahs) => emit(SurahsLoaded(surahs: surahs, juzs: state.juzs, pages: state.pages)),
    );
  }

  Future<void> getJuzs() async {
    emit(JuzsLoading(surahs: state.surahs, pages: state.pages));
    final result = await getJuzsUsecase();
    result.fold(
      (error) => emit(JuzsError(error: error, surahs: state.surahs, pages: state.pages)),
      (juzs) => emit(JuzsLoaded(juzs: juzs, surahs: state.surahs, pages: state.pages)),
    );
  }

  Future<void> getPages() async {
    emit(PagesLoading(surahs: state.surahs, juzs: state.juzs));
    final result = await getPagesUsecase();
    result.fold(
      (error) => emit(PagesError(error: error, surahs: state.surahs, juzs: state.juzs)),
      (pages) => emit(PagesLoaded(surahs: state.surahs, juzs: state.juzs, pages: pages)),
    );
  }

  Future<Surah?> getSurah(Surah surah) async {
    final result = await getSurahUsecase(surah);
    return result.getOrCrash();
  }
}
