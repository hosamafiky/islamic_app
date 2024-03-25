import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/helpers/dio_helper.dart';
import 'package:islamic_app/features/surah/data/datasources/surah_local_data_source.dart';
import 'package:islamic_app/features/surah/data/datasources/surah_remote_data_source.dart';
import 'package:islamic_app/features/surah/data/repositories/surah_repository_impl.dart';
import 'package:islamic_app/features/surah/domain/usecases/get_surah_usecase.dart';
import 'package:islamic_app/features/surah/presentation/cubit/surah_cubit.dart';

import '../../../quran/domain/entities/surah.dart';
import '../../domain/usecases/get_ayah_audio_usecase.dart';
import '../widgets/ayahs_list.dart';
import '../widgets/surah_card_widget.dart';

class SurahScreen extends StatelessWidget {
  static const String routeName = '/surah';
  const SurahScreen(this.surah, {super.key});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahCubit(
        getSurahUsecase: GetSurahUsecase(
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
      )..getSurah(surah),
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

  void scrollListener(int page, int totalPages) {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      if (page < totalPages) {
        context.read<SurahCubit>().getSurah(widget.surah, pageNumber: page + 1);
      }
    }
  }

  @override
  void initState() {
    scrollController.addListener(() {
      final state = context.read<SurahCubit>().state;
      if (state is AyahsLoaded) {
        scrollListener(state.pagination.currentPage, state.pagination.totalPages);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {
      final state = context.read<SurahCubit>().state;
      if (state is AyahsLoaded) {
        scrollListener(state.pagination.currentPage, state.pagination.totalPages);
      }
    });
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.surah.title)),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SurahCardWidget(widget.surah),
          SliverToBoxAdapter(child: 16.vsb),
          const AyahsList(),
        ],
      ),
    );
  }
}
