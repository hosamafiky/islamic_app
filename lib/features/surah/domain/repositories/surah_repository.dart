import 'package:dartz/dartz.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/features/surah/domain/entities/ayah.dart';
import 'package:islamic_app/features/surah/domain/entities/surah.dart';

import '../../../../core/models/pagination.dart';

abstract class SurahRepository {
  Future<Either<AppError, List<Ayah>>> getSurahAyahs(Surah surah, {Pagination pagination = const Pagination()});
  Future<Either<AppError, String>> getSurahAyahAudio(int surahIndex, int ayahIndex);
}
