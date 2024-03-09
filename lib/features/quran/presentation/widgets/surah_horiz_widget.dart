import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/quran/presentation/cubit/quran_cubit.dart';
import 'package:islamic_app/features/surah/presentation/pages/surah_screen.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../domain/entities/surah.dart';

class SurahHorizWidget extends StatelessWidget {
  const SurahHorizWidget(this.surah, {super.key});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        final newSurah = await context.read<QuranCubit>().getSurah(surah);
        if (newSurah != null) {
          if (!context.mounted) return;
          Navigator.of(context).pushNamed(SurahScreen.routeName, arguments: newSurah);
        }
      },
      visualDensity: VisualDensity.compact,
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(AssetsManager.icons.shape1),
          ),
        ),
        child: Center(
          child: Text(
            int.parse(surah.index).toString(),
            style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
      title: Text(
        surah.title,
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        '${surah.type} - ${surah.count} verses',
        style: TextStyle(
          color: Theme.of(context).appBarTheme.iconTheme?.color,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
      trailing: Text(
        surah.titleAr.split(' ').last,
        style: TextStyle(
          fontFamily: 'Amiri',
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
