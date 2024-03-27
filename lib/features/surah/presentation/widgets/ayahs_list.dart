import 'package:flutter/material.dart';
import 'package:islamic_app/core/extensions/sizing_ext.dart';
import 'package:islamic_app/core/extensions/spaced_column.dart';
import 'package:islamic_app/features/surah/presentation/widgets/ayah_widget.dart';

import '../../domain/entities/ayah.dart';

class AyahsList extends StatelessWidget {
  const AyahsList(this.ayahs, {super.key});

  final List<Ayah> ayahs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.aw).copyWith(
        bottom: 24.ah + MediaQuery.viewPaddingOf(context).bottom,
      ),
      child: SpacedColumn.withSpacing(
        spacing: 24.ah,
        children: ayahs.map((ayah) => AyahWidget(ayah)).toList(),
      ),
    );
  }
}
