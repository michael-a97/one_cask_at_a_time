import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_cask_at_a_time/core/core.dart';

void main() {
  group('$AuthenticationRepositoryImpl', () {
    late AuthenticationRepositoryImpl authenticationRepositoryImpl;
    late AuthenticationDataSource authenticationDataSource;

    setUp(() {
      authenticationDataSource = _MockAuthenticationDataSource();
      authenticationRepositoryImpl = AuthenticationRepositoryImpl(
        authenticationDataSource,
      );
    });

    group('signIn', () {
      const email = 'test@email.com';
      const password = 'password123';

      test(
        'should return the response returned from the data source',
        () async {
          when(
            () => authenticationDataSource.signIn(
              email: email,
              password: password,
            ),
          ).thenAnswer((_) async => right(unit));

          final result = await authenticationRepositoryImpl.signIn(
            email: email,
            password: password,
          );

          expect(result, right(unit));
          verify(
            () => authenticationDataSource.signIn(
              email: email,
              password: password,
            ),
          ).called(1);
        },
      );
    });
  });
}

class _MockAuthenticationDataSource extends Mock
    implements AuthenticationDataSource {}
