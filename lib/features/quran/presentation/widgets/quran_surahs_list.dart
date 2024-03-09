import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/quran_cubit.dart';
import 'surah_horiz_widget.dart';

class QuranSurahsList extends StatelessWidget {
  const QuranSurahsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      buildWhen: (previous, current) => current is SurahsLoaded || current is SurahsError || current is SurahsLoading,
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
        return ListView.separated(
          itemBuilder: (context, index) => SurahHorizWidget(state.surahs[index]),
          separatorBuilder: (context, index) => const Divider(indent: 20, endIndent: 20),
          itemCount: state.surahs.length,
        );
      },
    );
  }
}
