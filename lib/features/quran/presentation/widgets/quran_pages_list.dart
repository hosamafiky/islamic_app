import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/quran_cubit.dart';

class QuranPagesList extends StatefulWidget {
  const QuranPagesList({super.key});

  @override
  State<QuranPagesList> createState() => _QuranPagesListState();
}

class _QuranPagesListState extends State<QuranPagesList> {
  final scrollController = ScrollController();

  void onScroll(int pageNumber, int totalPages) {
    if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 20) {
      if (pageNumber < totalPages) {
        context.read<QuranCubit>().getPages(pageNumber + 1);
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
          controller: scrollController,
          itemBuilder: (context, index) => ListTile(
            visualDensity: VisualDensity.compact,
            title: Text('Page ${state.pages[index].index}'),
            subtitle: Text(
              'Start: ${state.pages[index].start.verse.split('_').last} - End: ${state.pages[index].end.verse.split('_').last}',
            ),
          ),
          separatorBuilder: (context, index) => const Divider(indent: 20, endIndent: 20),
          itemCount: state.pages.length,
        );
      },
    );
  }
}
