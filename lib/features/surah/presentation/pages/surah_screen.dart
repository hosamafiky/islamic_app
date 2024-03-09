import 'package:flutter/material.dart';

import '../../../quran/domain/entities/surah.dart';

class SurahScreen extends StatelessWidget {
  static const String routeName = '/surah';
  const SurahScreen(this.surah, {super.key});

  final Surah surah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: surah.verses.map((e) => Text(e.text)).toList(),
        ),
      ),
    );
  }
}
