import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../../dtos/user/user.dart';
part 'users_json.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationLocalDataSource implements AuthenticationDataSource {
  @override
  Future<Either<AuthenticationFailure, Unit>> signIn({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    final registeredUsers = userJson.map(User.fromJson).toList();

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
