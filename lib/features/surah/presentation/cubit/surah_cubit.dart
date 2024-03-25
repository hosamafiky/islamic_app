import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';
import 'package:islamic_app/features/surah/domain/usecases/get_ayah_audio_usecase.dart';

import '../../domain/usecases/get_surah_usecase.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit({
    required this.getSurahUsecase,
    required this.getAyahAudioUsecase,
  }) : super(const SurahInitial());

  final GetSurahUsecase getSurahUsecase;
  final GetAyahAudioUsecase getAyahAudioUsecase;

  void getSurah(Surah surah, {int pageNumber = 1}) async {
    final result = await getSurahUsecase(surah, pageNumber);
    return result.fold(
      (error) => emit(AyahsError(error: error, pagination: state.pagination)),
      (ayahs) {
        final allAyahs = state.ayahs + ayahs.$2;
        for (var aya in allAyahs) {
          if (aya.audioUrl.isEmpty) {
            getSurahAudio(int.parse(surah.index), aya.number);
          }
        }
        emit(AyahsLoaded(ayahs: state.ayahs + ayahs.$2, pagination: ayahs.$1));
      },
    );
  }

  void getSurahAudio(int surahIndex, int ayahIndex) async {
    final result = await getAyahAudioUsecase(surahIndex, ayahIndex);
    return result.fold(
      (error) {},
      (audio) {
        List<Verse> ayahs = List<Verse>.from(state.ayahs);
        ayahs[ayahIndex - 1] = ayahs[ayahIndex - 1].copyWith(audioUrl: audio);
        emit(AyahsLoaded(ayahs: ayahs, pagination: state.pagination));
      },
    );
  }
}
