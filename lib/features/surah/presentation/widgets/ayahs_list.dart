import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/errors_exceptions/errors.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/spaced_column.dart';
import 'package:islamic_app/core/themes/data/themes.dart';
import 'package:islamic_app/core/utils/app_text_styles.dart';
import 'package:islamic_app/features/surah/presentation/widgets/ayah_widget.dart';

import '../cubit/surah_cubit.dart';

class AyahsList extends StatelessWidget {
  const AyahsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                state.error is UnhandledError ? 'Something went wrong' : state.error!.message,
                style: LightAppTextStyles.medium14.copyWith(
                  color: LightAppColors.errorColor,
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
