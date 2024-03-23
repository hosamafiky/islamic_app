import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';

import '../../domain/usecases/get_surah_usecase.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit({
    required this.getSurahUsecase,
  }) : super(const SurahInitial());

  final GetSurahUsecase getSurahUsecase;

  void getSurah(Surah surah, {int pageNumber = 1}) async {
    final result = await getSurahUsecase(surah, pageNumber);
    return result.fold(
      (error) => emit(AyahsError(error: error)),
      (surah) => emit(AyahsLoaded(ayahs: surah.verses)),
    );
  }
}
