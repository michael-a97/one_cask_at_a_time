import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class AuthenticationRepository {
  Future<Either<AuthenticationFailure, Unit>> signIn({
    required String email,
    required String password,
  });
}
