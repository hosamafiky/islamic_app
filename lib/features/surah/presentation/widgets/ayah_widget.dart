import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/features/quran/domain/entities/surah.dart';

import 'ayah_actions_widget.dart';

class AyahWidget extends StatelessWidget {
  const AyahWidget(this.ayah, {super.key});

  final Verse ayah;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AyahActionsWidget(ayah: ayah),
        24.vsb,
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            ayah.text,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  height: 2.1,
                ),
          ),
        ),
      ],
    );
  }
}
