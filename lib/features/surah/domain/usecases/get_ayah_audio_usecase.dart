import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/surah/domain/repositories/surah_repository.dart';

class GetAyahAudioUsecase {
  final SurahRepository repository;

  GetAyahAudioUsecase(this.repository);

  Future<Either<AppError, String>> call(int surahIndex, int ayahIndex) async {
    return await repository.getSurahAyahAudio(surahIndex, ayahIndex);
  }
}
