import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/svg_extension.dart';
import 'package:islamic_app/core/resources/assets_manager.dart';
import 'package:islamic_app/core/themes/data/themes.dart';
import 'package:islamic_app/core/utils/app_text_styles.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';

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
                  ayah.number.toString(),
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
