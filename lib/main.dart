import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/application.dart';
import 'application/application_bloc_observer.dart';
import 'config/config.dart';
import 'features/shared/application/connectivity_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  AppBlocObserver.init();
  final connectivityCubit = getIt<ConnectivityCubit>();
  await connectivityCubit.listen();
  runApp(
    BlocProvider(
      create: (context) => connectivityCubit,
      child: const Application(),
    ),
  );
}
