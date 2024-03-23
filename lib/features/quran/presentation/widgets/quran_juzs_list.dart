import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/quran_cubit.dart';
import 'juz_widget.dart';

class QuranJuzsList extends StatefulWidget {
  const QuranJuzsList({super.key});

  @override
  State<QuranJuzsList> createState() => _QuranJuzsListState();
}

class _QuranJuzsListState extends State<QuranJuzsList> {
  final scrollController = ScrollController();

  void onScroll(int pageNumber, int totalPages) {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 20) {
      if (pageNumber < totalPages) {
        context.read<QuranCubit>().getJuzs(pageNumber + 1);
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
    super.dispose();
  }

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
          controller: scrollController,
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
