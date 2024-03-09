import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(text: 'Surahs'),
        Tab(text: 'Juz\'s'),
        Tab(text: 'Pages'),
      ],
    );
  }
}
