import 'package:flutter/material.dart';
import 'package:islamic_app/features/surah/presentation/pages/surah_screen.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../domain/entities/surah.dart';

class SurahHorizWidget extends StatelessWidget {
  const SurahHorizWidget(this.surah, {super.key});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, SurahScreen.routeName, arguments: surah),
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
            style: Theme.of(context).listTileTheme.titleTextStyle!.copyWith(fontSize: 14),
          ),
        ),
      ),
      title: Text(surah.title),
      subtitle: Text('${surah.type} - ${surah.count} verses'.toUpperCase()),
      trailing: Text(surah.titleAr.split(' ').last),
    );
  }
}
