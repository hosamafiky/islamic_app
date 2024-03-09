import 'package:flutter/material.dart';

import '../../domain/entities/juz.dart';

class JuzWidget extends StatelessWidget {
  const JuzWidget(this.juz, {super.key});

  final Juz juz;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      title: Text(
        'Juz\' ${juz.index}',
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        'Verses ${juz.start.verse.split('_').last} - ${juz.end.verse.split('_').last}',
        style: TextStyle(
          color: Theme.of(context).appBarTheme.iconTheme?.color,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}
