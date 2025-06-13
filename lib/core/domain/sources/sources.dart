import 'package:dartz/dartz.dart';

import '../../core.dart';

export 'authentication_data_source.dart';
export 'product_data_source.dart';

abstract class AuthenticationDataSource {
  Future<Either<AuthenticationFailure, Unit>> signIn({
    required String email,
    required String password,
  });
}
