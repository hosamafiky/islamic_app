import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/helpers/dio_helper.dart';
import 'package:islamic_app/features/reader/data/datasources/reader_local_datasource.dart';
import 'package:islamic_app/features/reader/data/repositories/readers_repository_impl.dart';
import 'package:islamic_app/features/reader/domain/usecases/get_readers_usecase.dart';
import 'package:islamic_app/features/reader/presentation/cubit/reader_cubit.dart';
import 'package:islamic_app/features/surah/data/datasources/surah_local_data_source.dart';
import 'package:islamic_app/features/surah/data/datasources/surah_remote_data_source.dart';
import 'package:islamic_app/features/surah/data/repositories/surah_repository_impl.dart';
import 'package:islamic_app/features/surah/presentation/cubit/surah_cubit.dart';

import '../../domain/entities/ayah.dart';
import '../../domain/entities/surah.dart';
import '../../domain/usecases/get_ayah_audio_usecase.dart';
import '../widgets/ayahs_list.dart';
import '../widgets/surah_card_widget.dart';

class SurahScreen extends StatelessWidget {
  static const String routeName = '/surah';
  const SurahScreen(this.surah, {super.key});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SurahCubit(
            getAyahAudioUsecase: GetAyahAudioUsecase(
              SurahRepositoryImpl(
                surahRemoteDatasource: SurahRemoteDatasourceImpl(dioHelper: DioHelper()),
                surahLocalDatasource: SurahLocalDatasourceImpl(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ReaderCubit(
            getReadersUsecase: GetReadersUsecase(
              ReadersRepositoryImpl(ReaderLocalDatasourceImpl()),
            ),
          )..getReaders(),
        ),
      ],
      child: SurahScreenBody(surah: surah),
    );
  }
}

class SurahScreenBody extends StatefulWidget {
  const SurahScreenBody({super.key, required this.surah});

  final Surah surah;

  @override
  State<SurahScreenBody> createState() => _SurahScreenBodyState();
}

class _SurahScreenBodyState extends State<SurahScreenBody> {
  final scrollController = ScrollController();
  int pageNumber = 1;
  ValueNotifier<List<Ayah>> ayahs = ValueNotifier([]);

  void scrollListener(int page, int totalPages) {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      if (page < totalPages) {
        ayahs.value = [...ayahs.value, ...getAyahs(page + 1)];
      }
    }
  }

  @override
  void initState() {
    ayahs.value = getAyahs(1);
    scrollController.addListener(() {
      scrollListener(pageNumber, widget.surah.ayahs.length ~/ 10);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {
      scrollListener(pageNumber, widget.surah.ayahs.length ~/ 10);
    });
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surah.englishName),
        // actions: [
        //   ReadersDropdownWidget(
        //     onReaderSelected: (reader) {},
        //   )
        // ],
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SurahCardWidget(widget.surah),
          SliverToBoxAdapter(child: 16.vsb),
          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: ayahs,
              builder: (BuildContext context, List<Ayah> ayahsList, Widget? child) {
                return AyahsList(ayahsList);
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Ayah> getAyahs(int pageNumber, {int pageSize = 10}) {
    this.pageNumber = pageNumber;
    final data = widget.surah.ayahs;
    final start = (pageNumber - 1) * pageSize;
    final end = min(pageNumber * pageSize, data.length);
    return data.sublist(start, end);
  }
}
