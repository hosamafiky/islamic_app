import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/svg_extension.dart';
import 'package:islamic_app/core/resources/assets_manager.dart';
import 'package:islamic_app/core/themes/data/themes.dart';

import '../../../quran/domain/entities/surah.dart';
import 'ayah_audio_widget.dart';

class AyahActionsWidget extends StatelessWidget {
  const AyahActionsWidget({super.key, required this.ayah});

  final Verse ayah;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13.aw, vertical: 10.ah),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 13.5,
            backgroundColor: LightAppColors.primaryColor,
            child: Text(
              ayah.number.toString(),
              style: Theme.of(context).textTheme.titleMedium,
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
          if (ayah.audioUrl.isNotEmpty) AyahAudioWidget(url: ayah.audioUrl),
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
    );
  }
}
