import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/features/surah/domain/entities/ayah.dart';

import 'ayah_actions_widget.dart';

class AyahWidget extends StatelessWidget {
  const AyahWidget(this.ayah, {super.key});

  final Ayah ayah;

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
