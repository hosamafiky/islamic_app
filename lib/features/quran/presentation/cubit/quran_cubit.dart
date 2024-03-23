import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/quran/domain/entities/page.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_juzs_usecase.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_pages_usecase.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_surahs_usecase.dart';

import '../../domain/entities/juz.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit({
    required this.getSurahsUsecase,
    required this.getJuzsUsecase,
    required this.getPagesUsecase,
  }) : super(const QuranInitial());

  final GetSurahsUsecase getSurahsUsecase;
  final GetJuzsUsecase getJuzsUsecase;
  final GetPagesUsecase getPagesUsecase;

  Future<void> getSurahs([int pageNumber = 1]) async {
    if (pageNumber == 1) emit(SurahsLoading(juzs: state.juzs, pages: state.pages, pagination: state.pagination));
    final result = await getSurahsUsecase(pageNumber);
    result.fold(
      (error) => emit(SurahsError(error: error, juzs: state.juzs, pages: state.pages, pagination: state.pagination)),
      (surahs) => emit(SurahsLoaded(surahs: state.surahs + surahs.$2, pagination: surahs.$1, juzs: state.juzs, pages: state.pages)),
    );
  }

  Future<void> getJuzs([int pageNumber = 1]) async {
    if (pageNumber == 1) emit(JuzsLoading(surahs: state.surahs, pages: state.pages, pagination: state.pagination));
    final result = await getJuzsUsecase(pageNumber);
    result.fold(
      (error) => emit(JuzsError(error: error, surahs: state.surahs, pages: state.pages, pagination: state.pagination)),
      (juzs) => emit(JuzsLoaded(juzs: state.juzs + juzs.$2, surahs: state.surahs, pages: state.pages, pagination: juzs.$1)),
    );
  }

  Future<void> getPages([int pageNumber = 1]) async {
    if (pageNumber == 1) emit(PagesLoading(surahs: state.surahs, juzs: state.juzs, pagination: state.pagination));
    final result = await getPagesUsecase(pageNumber);
    result.fold(
      (error) => emit(PagesError(error: error, surahs: state.surahs, juzs: state.juzs, pagination: state.pagination)),
      (pages) => emit(PagesLoaded(surahs: state.surahs, juzs: state.juzs, pages: state.pages + pages.$2, pagination: pages.$1)),
    );
  }

  void resetPagination() {
    emit(QuranInitial(
      surahs: state.surahs,
      juzs: state.juzs,
      pages: state.pages,
    ));
  }
}
