import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_cask_at_a_time/core/core.dart';

void main() {
  group('$AuthenticationLocalDataSource', () {
    late AuthenticationLocalDataSource authenticationLocalDataSource;

    setUp(() {
      authenticationLocalDataSource = AuthenticationLocalDataSource();
    });
    group('signIn', () {
      test('should return unit when email and password are valid', () async {
        final result = await authenticationLocalDataSource.signIn(
          email: 'John@doe.com',
          password: '1234',
        );
        expect(result, right(unit));
      });
      
      test('should return invalidCredentials when email and password are not '
          'valid', () async {
        final result = await authenticationLocalDataSource.signIn(
          email: 'Unauthorized@user.com',
          password: 'wrong password',
        );
        expect(result, left(AuthenticationFailure.invalidCredentials));
      });
    });
  });
}
