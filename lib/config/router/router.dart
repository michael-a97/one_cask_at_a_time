import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

import 'router.gr.dart';
export 'router.gr.dart';

@Injectable()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AdaptiveRoute(page: SplashRoute.page),
    AdaptiveRoute(page: SignInRoute.page),
    AdaptiveRoute(page: HomeRoute.page, initial: true),
  ];
}
