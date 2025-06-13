import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class DecoratedBackground extends StatelessWidget {
  final Widget child;

  const DecoratedBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ColoredBox(
      color: theme.primaryColorDark,
      child: Stack(
        children: [
          Image.asset(
            Assets.images.splashBackground.path,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          child,
        ],
      ),
    );
  }
}
