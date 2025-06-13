import 'package:flutter/material.dart';

import 'application/application.dart';
import 'config/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const Application());
}
