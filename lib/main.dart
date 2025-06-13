import 'package:flutter/material.dart';

import 'application/application.dart';
import 'application/application_bloc_observer.dart';
import 'config/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  AppBlocObserver.init();

  runApp(const Application());
}
