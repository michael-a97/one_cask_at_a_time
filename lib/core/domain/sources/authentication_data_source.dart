import 'package:dartz/dartz.dart';

enum AuthenticationFailure {
  invalidCredentials,
  userNotFound,
  networkError,
  unknownError,
}

/// An abstract class that defines the contract for a local data source
abstract class AuthenticationDataSource {
  Future<Either<AuthenticationFailure, Unit>> signIn({
    required String email,
    required String password,
  });
}
