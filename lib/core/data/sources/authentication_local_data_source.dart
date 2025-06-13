import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../dtos/user.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationLocalDataSource implements AuthenticationDataSource {
  static const registeredUsers = <User>[
    User(email: 'John@doe.com', password: '1234'),
    User(email: 'Jane@doe.com', password: '4321'),
  ];

  @override
  Future<Either<AuthenticationFailure, Unit>> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    final user = registeredUsers
        .where(
          (user) =>
              user.email.toLowerCase() == email.toLowerCase().trim() &&
              user.password == password,
        )
        .firstOrNull;
    if (user == null) {
      return left(AuthenticationFailure.invalidCredentials);
    } else {
      return right(unit);
    }
  }
}
