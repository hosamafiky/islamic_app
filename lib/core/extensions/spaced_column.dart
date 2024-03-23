import 'package:flutter/material.dart';

extension SpacedColumn on Column {
  static Column withSpacing({
    required List<Widget> children,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    double spacing = 0,
  }) =>
      Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: [
          for (var child in children) ...[
            child,
            if (children.last != child) SizedBox(height: spacing),
          ],
        ],
      );
}
