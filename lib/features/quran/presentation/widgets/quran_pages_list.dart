import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/quran_cubit.dart';

class QuranPagesList extends StatelessWidget {
  const QuranPagesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      buildWhen: (previous, current) => current is PagesLoaded || current is PagesError || current is PagesLoading,
      builder: (context, state) {
        if (state is PagesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PagesError) {
          return Center(
            child: Text(state.error!.message),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) => ListTile(
            visualDensity: VisualDensity.compact,
            title: Text(
              'Page ${state.pages[index].index}',
              style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              'Start: ${state.pages[index].start.verse.split('_').last} - End: ${state.pages[index].end.verse.split('_').last}',
              style: TextStyle(
                color: Theme.of(context).appBarTheme.iconTheme?.color,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(indent: 20, endIndent: 20),
          itemCount: state.pages.length,
        );
      },
    );
  }
}
