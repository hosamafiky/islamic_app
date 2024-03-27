import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/models/pagination.dart';
import 'package:islamic_app/features/surah/domain/entities/ayah.dart';
import 'package:islamic_app/features/surah/domain/usecases/get_ayah_audio_usecase.dart';

part 'surah_state.dart';

class SurahCubit extends Cubit<SurahState> {
  SurahCubit({
    required this.getAyahAudioUsecase,
  }) : super(const SurahInitial());

  final GetAyahAudioUsecase getAyahAudioUsecase;
}
