part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final LoadingStatus status;
  final AuthenticationFailure? error;
  final String? email;
  final String? password;

  const SignInState({
    this.status = LoadingStatus.initial,
    this.error,
    this.email,
    this.password,
  });

  SignInState loading() {
    return SignInState(
      status: LoadingStatus.inProgress,
      email: email,
      password: password,
    );
  }

  SignInState failure(AuthenticationFailure error) {
    return SignInState(
      status: LoadingStatus.failure,
      email: email,
      password: password,
      error: error,
    );
  }

  SignInState success() {
    return SignInState(
      status: LoadingStatus.success,
      email: email,
      password: password,
    );
  }

  SignInState edit({String? email, String? password}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [status, error, email, password];
}
