import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_cask_at_a_time/config/config.dart';
import 'package:one_cask_at_a_time/core/core.dart';
import 'package:one_cask_at_a_time/features/features.dart';

import '../../../helpers/pump_app.dart';

void main() {
  group('$SignInView', () {
    late StackRouter router;
    late SignInCubit signInCubit;

    setUp(() {
      router = _MockStackRouter();
      signInCubit = MockSignInCubit();
    });

    Future<void> pumpWidgetUnderTest(WidgetTester tester) async {
      await tester.pumpApp(
        BlocProvider(
          create: (context) => signInCubit,
          child: Material(
            child: StackRouterScope(
              controller: router,
              stateHash: 0,
              child: RouterScope(
                stateHash: 0,
                controller: router,
                navigatorObservers: [NavigatorObserver()],
                inheritableObserversBuilder: () => [],
                child: const SignInView(),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('renders correctly', (tester) async {
      const signInState = SignInState();
      whenListen(signInCubit, Stream.value(signInState));
      when(() => signInCubit.state).thenReturn(signInState);
      when(() => signInCubit.close()).thenAnswer((_) async {});

      await pumpWidgetUnderTest(tester);

      expect(find.text('Sign in'), findsAtLeast(1));
      expect(find.byType(AppBar), findsAtLeast(1));
      expect(find.byType(EmailInputField), findsAtLeast(1));
      expect(find.byType(PasswordInputField), findsAtLeast(1));
      expect(find.byType(ContinueButton), findsAtLeast(1));
      expect(find.byType(RecoverPasswordSection), findsAtLeast(1));
    });

    testWidgets('shows success snackbar when successful', (tester) async {
      const signInState = SignInState(status: LoadingStatus.success);
      when(
        () => router.replaceAll([const HomeRoute()]),
      ).thenAnswer((_) async {});
      whenListen(signInCubit, Stream.value(signInState));
      when(() => signInCubit.state).thenReturn(signInState);
      when(() => signInCubit.close()).thenAnswer((_) async {});

      await pumpWidgetUnderTest(tester);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOne);
      expect(find.text('Successfully signed in!'), findsOne);
      verify(() => router.replaceAll([const HomeRoute()])).called(1);
    });

    testWidgets('shows loading dialog when loading', (tester) async {
      const signInState = SignInState(status: LoadingStatus.inProgress);
      whenListen(signInCubit, Stream.value(signInState));
      when(() => signInCubit.state).thenReturn(signInState);
      when(() => signInCubit.close()).thenAnswer((_) async {});

      await pumpWidgetUnderTest(tester);
      await tester.pump();

      expect(
        find.byType(ProgressIndicatorDialog<SignInCubit, SignInState>),
        findsOne,
      );
    });

    testWidgets('shows error snackbar when unsuccessful', (tester) async {
      const signInState = SignInState(
        status: LoadingStatus.failure,
        error: AuthenticationFailure.invalidCredentials,
      );
      whenListen(signInCubit, Stream.value(signInState));
      when(() => signInCubit.state).thenReturn(signInState);
      when(() => signInCubit.close()).thenAnswer((_) async {});

      await pumpWidgetUnderTest(tester);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOne);
      expect(find.text('Please enter valid credentials'), findsOne);
    });
  });
}

class _MockStackRouter extends Mock implements StackRouter {}

class MockSignInCubit extends Mock implements SignInCubit {}
