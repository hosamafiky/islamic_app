import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/helpers/dio_helper.dart';
import 'package:islamic_app/features/last_read/presentation/cubit/last_read_cubit.dart';
import 'package:islamic_app/features/reader/data/datasources/reader_local_datasource.dart';
import 'package:islamic_app/features/reader/data/repositories/readers_repository_impl.dart';
import 'package:islamic_app/features/reader/domain/usecases/get_readers_usecase.dart';
import 'package:islamic_app/features/reader/presentation/cubit/reader_cubit.dart';
import 'package:islamic_app/features/surah/data/datasources/surah_local_data_source.dart';
import 'package:islamic_app/features/surah/data/datasources/surah_remote_data_source.dart';
import 'package:islamic_app/features/surah/data/repositories/surah_repository_impl.dart';
import 'package:islamic_app/features/surah/domain/usecases/get_ayahs_usecase.dart';
import 'package:islamic_app/features/surah/presentation/cubit/surah_cubit.dart';

import '../../../reader/presentation/widgets/readers_dropdown.dart';
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
            getAyahsUsecase: GetAyahsUsecase(
              SurahRepositoryImpl(
                surahRemoteDatasource: SurahRemoteDatasourceImpl(dioHelper: DioHelper()),
                surahLocalDatasource: SurahLocalDatasourceImpl(),
              ),
            ),
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

  void scrollListener() {
    final surahCubit = context.read<SurahCubit>();
    final page = surahCubit.state.pagination.currentPage;
    final totalPages = surahCubit.state.pagination.totalPages;
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      if (page < totalPages) {
        surahCubit.getSurahAyahs(widget.surah, pagination: surahCubit.state.pagination.copyWith(currentPage: page + 1));
      }
    }
  }

  @override
  void initState() {
    context.read<SurahCubit>().getSurahAyahs(widget.surah);
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void _updateLastRead(int startVerseIndex, int endVerseIndex) {
    context.read<LastReadCubit>().updateLastRead(widget.surah, startVerseIndex, endVerseIndex);
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surah.englishName),
        actions: [ReadersDropdownWidget(onReaderSelected: (reader) {})],
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SurahCardWidget(widget.surah),
          SliverToBoxAdapter(child: 16.vsb),
          SliverToBoxAdapter(
            child: BlocConsumer<SurahCubit, SurahState>(
              listener: (context, state) {
                if (state is AyahsLoaded) {
                  _updateLastRead(state.ayahs[max(state.ayahs.length - 10, 0)].numberInSurah, state.ayahs.last.numberInSurah);
                }
              },
              builder: (context, state) {
                return AyahsList(state.ayahs);
              },
            ),
          ),
        ],
      ),
    );
  }
}
