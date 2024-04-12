import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/resources/assets_manager.dart';
import 'package:islamic_app/core/themes/data/themes.dart';
import 'package:islamic_app/core/utils/app_text_styles.dart';

import '../../domain/entities/surah.dart';

class SurahCardWidget extends StatelessWidget {
  const SurahCardWidget(this.surah, {super.key});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 257.ah,
        margin: const EdgeInsets.all(24),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 56.5.aw, vertical: 28.5.ah),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(AssetsManager.images.surahCard),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: LightAppColors.primaryColor.withOpacity(0.35),
              offset: const Offset(0, 9),
              blurRadius: 30,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(surah.englishName, style: LightAppTextStyles.medium26),
            4.vsb,
            Text(
              surah.englishNameTranslation,
              style: LightAppTextStyles.medium16.copyWith(
                color: Colors.white,
              ),
            ),
            Divider(
              height: 32.ah,
              color: Colors.white.withOpacity(0.35),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: surah.revelationType.toUpperCase(),
                    style: LightAppTextStyles.medium16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  WidgetSpan(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).copyWith(bottom: 4),
                      child: const CircleAvatar(radius: 3, backgroundColor: Colors.white),
                    ),
                  ),
                  TextSpan(
                    text: '${surah.ayahs.length} Ayahs',
                    style: LightAppTextStyles.medium16.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Image.asset(AssetsManager.images.besmellah, height: 48.ah),
          ],
        ),
      ),
    );
  }
}
