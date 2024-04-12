import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/surah/domain/entities/ayah.dart';
import 'package:islamic_app/features/surah/domain/entities/surah.dart';
import 'package:islamic_app/features/surah/domain/usecases/get_ayah_audio_usecase.dart';
import 'package:islamic_app/features/surah/domain/usecases/get_ayahs_usecase.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit({
    required this.getAyahAudioUsecase,
    required this.getAyahsUsecase,
  }) : super(const SurahInitial());

  final GetAyahAudioUsecase getAyahAudioUsecase;
  final GetAyahsUsecase getAyahsUsecase;

  void getSurahAyahs(Surah surah, {Pagination pagination = const Pagination()}) async {
    emit(AyahsLoading(ayahs: state.ayahs, pagination: pagination));
    final result = await getAyahsUsecase(surah, pagination: pagination);
    result.fold(
      (error) => emit(AyahsError(error: error, pagination: pagination)),
      (ayahs) => emit(AyahsLoaded(ayahs: [...state.ayahs, ...ayahs], pagination: pagination)),
    );
  }
}
