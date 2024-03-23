import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/spaced_column.dart';
import 'package:islamic_app/core/extensions/svg_extension.dart';
import 'package:islamic_app/core/resources/assets_manager.dart';
import 'package:islamic_app/core/themes/data/themes.dart';
import 'package:islamic_app/core/utils/app_text_styles.dart';
import 'package:islamic_app/features/surah/data/datasources/surah_local_data_source.dart';
import 'package:islamic_app/features/surah/data/repositories/surah_repository_impl.dart';
import 'package:islamic_app/features/surah/domain/usecases/get_surah_usecase.dart';
import 'package:islamic_app/features/surah/presentation/cubit/surah_cubit.dart';

import '../../../quran/domain/entities/surah.dart';
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
          SliverToBoxAdapter(
            child: BlocBuilder<SurahCubit, SurahState>(
              buildWhen: (previous, current) => current.ayahs != previous.ayahs,
              builder: (context, state) {
                if (state is AyahsLoaded) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.aw).copyWith(
                      bottom: 24.ah + MediaQuery.viewPaddingOf(context).bottom,
                    ),
                    child: SpacedColumn.withSpacing(
                      spacing: 24.ah,
                      children: state.ayahs.map((ayah) => AyahWidget(ayah)).toList(),
                    ),
                  );
                } else if (state is AyahsError) {
                  return Center(
                    child: Text(
                      state.error!.message,
                      style: LightAppTextStyles.medium14.copyWith(
                        color: LightAppColors.errorColor,
                      ),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AyahWidget extends StatelessWidget {
  const AyahWidget(this.ayah, {super.key});

  final Verse ayah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 13.aw, vertical: 10.ah),
          decoration: BoxDecoration(
            color: const Color(0xFF121931).withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 13.5,
                backgroundColor: LightAppColors.primaryColor,
                child: Text(
                  (ayah.number + 1).toString(),
                  style: LightAppTextStyles.medium14.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: AssetsManager.icons.svg.share.asSvg(
                  width: 24.aw,
                  height: 24.ah,
                ),
              ),
              16.hsb,
              GestureDetector(
                onTap: () {},
                child: AssetsManager.icons.svg.play.asSvg(
                  width: 24.aw,
                  height: 24.ah,
                ),
              ),
              16.hsb,
              GestureDetector(
                onTap: () {},
                child: AssetsManager.icons.svg.bookmark.asSvg(
                  width: 24.aw,
                  height: 24.ah,
                ),
              ),
            ],
          ),
        ),
        24.vsb,
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            ayah.text,
            textAlign: TextAlign.end,
            style: LightAppTextStyles.amiriBold18.copyWith(height: 2.1),
          ),
        ),
      ],
    );
  }
}
