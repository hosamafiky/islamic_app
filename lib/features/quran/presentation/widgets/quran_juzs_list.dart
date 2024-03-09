import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/quran_cubit.dart';
import 'juz_widget.dart';

class QuranJuzsList extends StatelessWidget {
  const QuranJuzsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      buildWhen: (previous, current) => current is JuzsLoaded || current is JuzsError || current is JuzsLoading,
      builder: (context, state) {
        if (state is JuzsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is JuzsError) {
          return Center(
            child: Text(
              state.error!.message,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            final juz = state.juzs[index];
            return JuzWidget(juz);
          },
          separatorBuilder: (context, index) => const Divider(indent: 20, endIndent: 20),
          itemCount: state.juzs.length,
        );
      },
    );
  }
}
