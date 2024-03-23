import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/quran_cubit.dart';
import 'surah_horiz_widget.dart';

class QuranSurahsList extends StatefulWidget {
  const QuranSurahsList({super.key});

  @override
  State<QuranSurahsList> createState() => _QuranSurahsListState();
}

class _QuranSurahsListState extends State<QuranSurahsList> {
  final scrollController = ScrollController();

  void onScroll(int pageNumber, int totalPages) {
    print('pixels: ${scrollController.position.pixels}, maxScrollExtent: ${scrollController.position.maxScrollExtent - 20}');
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 20) {
      print('pageNumber: $pageNumber, totalPages: $totalPages');
      if (pageNumber < totalPages) {
        context.read<QuranCubit>().getSurahs(pageNumber + 1);
      }
    }
  }

  @override
  void initState() {
    scrollController.addListener(() {
      final state = context.read<QuranCubit>().state;
      onScroll(state.pagination.currentPage, state.pagination.totalPages);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {
      final state = context.read<QuranCubit>().state;
      onScroll(state.pagination.currentPage, state.pagination.totalPages);
    });
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      buildWhen: (previous, current) => current.surahs != previous.surahs || current is SurahsError || current is SurahsLoading,
      builder: (context, state) {
        if (state is SurahsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SurahsError) {
          return Center(
            child: Text(state.error!.message),
          );
        }
        return Scrollbar(
          controller: scrollController,
          child: ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) => SurahHorizWidget(state.surahs[index]),
            separatorBuilder: (context, index) => const Divider(indent: 20, endIndent: 20),
            itemCount: state.surahs.length,
          ),
        );
      },
    );
  }
}
