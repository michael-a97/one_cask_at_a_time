import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_cask_at_a_time/features/splash/presentation/widgets/splash_view.dart';

import '../../../helpers/pump_app.dart';

void main() {
  group('$SplashView', () {
    late StackRouter router;

    setUp(() {
      router = _MockStackRouter();
    });

    Future<void> pumpWidgetUnderTest(WidgetTester tester) async {
      await tester.pumpApp(
        Material(
          child: StackRouterScope(
            controller: router,
            stateHash: 0,
            child: RouterScope(
              stateHash: 0,
              controller: router,
              navigatorObservers: [NavigatorObserver()],
              inheritableObserversBuilder: () => [],
              child: const SplashView(),
            ),
          ),
        ),
      );
    }

    testWidgets('should render correctly', (tester) async {
      await pumpWidgetUnderTest(tester);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byType(AppLogo), findsOne);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text('Welcome!'), findsOne);
      expect(find.text('Scan bottle'), findsOne);
      expect(find.text('Have an account?'), findsOne);
      expect(find.text('Sign in first'), findsOne);
    });
  });
}

class _MockStackRouter extends Mock implements StackRouter {}
