import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/quran/presentation/cubit/quran_cubit.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      onTap: (_) => context.read<QuranCubit>().resetPagination(),
      tabs: const [
        Tab(text: 'Surahs'),
        Tab(text: 'Juz\'s'),
        Tab(text: 'Pages'),
      ],
    );
  }
}
