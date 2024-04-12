import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/helpers/cache_helper.dart';
import 'package:islamic_app/features/surah/data/models/surah_model.dart';
import 'package:islamic_app/features/surah/domain/entities/surah.dart';

part 'last_read_state.dart';

class LastReadCubit extends Cubit<LastReadState> {
  LastReadCubit({
    required this.cacheHelper,
  }) : super(const LastReadInitial());

  final CacheHelper cacheHelper;

  void updateLastRead(Surah surah, int startVerse, int endVerse) async {
    final isCached = await cacheHelper.putData(
      key: 'last_read',
      value: jsonEncode(
        {'surah': surah.toJson(), 'startVerse': startVerse, 'endVerse': endVerse},
      ),
    );

    if (!isCached) {
      emit(const LastReadInitial());
      return;
    }
    emit(LastReadUpdated(surah: surah, startVerse: startVerse, endVerse: endVerse));
  }

  void loadLastRead() async {
    final lastRead = await cacheHelper.getData(key: 'last_read');

    if (lastRead == null) {
      emit(const LastReadInitial());
      return;
    }

    final lastReadData = jsonDecode(lastRead) as Map<String, dynamic>;
    final lastReadSurah = SurahModel.fromJson(lastReadData['surah']);
    final lastReadStartVerse = lastReadData['startVerse'] as int;
    final lastReadEndVerse = lastReadData['endVerse'] as int;
    emit(LastReadLoaded(surah: lastReadSurah, startVerse: lastReadStartVerse, endVerse: lastReadEndVerse));
  }

  void clearLastRead() async {
    cacheHelper.removeData(key: 'last_read').whenComplete(
          () => emit(const LastReadInitial()),
        );
  }
}
