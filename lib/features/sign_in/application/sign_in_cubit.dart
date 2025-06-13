import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
import '../../shared/shared.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final AuthenticationRepository _authenticationRepository;

  SignInCubit(this._authenticationRepository) : super(const SignInState());

  void onEmailChanged(String email) {
    emit(state.edit(email: email));
  }

  void onPasswordChanged(String password) {
    emit(state.edit(password: password));
  }

  Future<void> submit() async {
    if ((state.password?.isEmpty ?? true) || (state.email?.isEmpty ?? true)) {
      return;
    }

    emit(state.loading());
    final response = await _authenticationRepository.signIn(
      email: state.email!,
      password: state.password!,
    );
    emit(response.fold(state.failure, (_) => state.success()));
  }
}
