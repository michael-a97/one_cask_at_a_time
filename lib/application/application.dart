import 'package:flutter/material.dart';

import '../config/config.dart';

final appRouter = getIt<AppRouter>();

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
      theme: theme,
    );
  }
}
