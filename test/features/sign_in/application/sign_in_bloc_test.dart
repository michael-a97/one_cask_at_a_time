import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_cask_at_a_time/core/core.dart';
import 'package:one_cask_at_a_time/features/features.dart';

void main() {
  group('$SignInCubit', () {
    late SignInCubit signInCubit;
    late AuthenticationRepository authenticationRepository;

    setUp(() {
      authenticationRepository = MockAuthenticationRepository();
      signInCubit = SignInCubit(authenticationRepository);
    });

    group('onEmailChanged', () {
      const email = 'email';

      blocTest(
        'should emit [SignInState] with updated email',
        build: () => signInCubit,
        act: (cubit) => cubit.onEmailChanged(email),
        expect: () => const [SignInState(email: email)],
      );
    });

    group('onPasswordChanged', () {
      const password = 'password';

      blocTest(
        'should emit [SignInState] with updated password',
        build: () => signInCubit,
        act: (cubit) => cubit.onPasswordChanged(password),
        expect: () => const [SignInState(password: password)],
      );
    });

    group('submit', () {
      const email = 'email';
      const password = 'password';

      blocTest<SignInCubit, SignInState>(
        'should emit[SignInState, SignInState] with LoadingStatus.inProgress '
        'and LoadingStatus.success when successful',
        build: () => signInCubit,
        seed: () => const SignInState(email: email, password: password),
        setUp: () {
          when(
            () => authenticationRepository.signIn(
              email: any(named: email),
              password: any(named: password),
            ),
          ).thenAnswer((_) async => right(unit));
        },
        act: (cubit) => cubit.submit(),
        expect: () => [
          const SignInState(
            status: LoadingStatus.inProgress,
            email: email,
            password: password,
          ),
          const SignInState(
            status: LoadingStatus.success,
            email: email,
            password: password,
          ),
        ],
      );

      blocTest<SignInCubit, SignInState>(
        'should emit[SignInState, SignInState] with LoadingStatus.inProgress '
        'and LoadingStatus.failure when unsuccessful',
        build: () => signInCubit,
        seed: () => const SignInState(email: email, password: password),
        setUp: () {
          when(
            () => authenticationRepository.signIn(
              email: any(named: email),
              password: any(named: password),
            ),
          ).thenAnswer(
            (_) async => left(AuthenticationFailure.invalidCredentials),
          );
        },
        act: (cubit) => cubit.submit(),
        expect: () => [
          const SignInState(
            status: LoadingStatus.inProgress,
            email: email,
            password: password,
          ),
          const SignInState(
            status: LoadingStatus.failure,
            error: AuthenticationFailure.invalidCredentials,
            email: email,
            password: password,
          ),
        ],
      );
    });
  });
}

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}
