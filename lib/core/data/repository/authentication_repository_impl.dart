import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationDataSource _authenticationDataSource;

  AuthenticationRepositoryImpl(this._authenticationDataSource);

  @override
  Future<Either<AuthenticationFailure, Unit>> signIn({
    required String email,
    required String password,
  }) {
    return _authenticationDataSource.signIn(email: email, password: password);
  }
}
