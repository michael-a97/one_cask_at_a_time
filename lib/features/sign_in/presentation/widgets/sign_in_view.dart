import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../config/config.dart';
import '../../../../core/domain/sources/authentication_data_source.dart';
import '../../../features.dart';

part 'email_input_field.dart';

part 'password_input_field.dart';

part 'continue_button.dart';

part 'recover_password_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: _listener,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: const Icon(Icons.arrow_back_sharp),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(Spacing.lg),
            children: [
              const Gap(Spacing.xxl),
              Text('Sign in', style: Theme.of(context).textTheme.displayLarge),
              const Gap(Spacing.xxl),
              const EmailInputField(),
              const Gap(Spacing.lg),
              const PasswordInputField(),
              const Gap(Spacing.xxxl),
              const ContinueButton(),
              const Gap(Spacing.xxxl),
              const RecoverPasswordSection(),
            ],
          ),
        ),
      ),
    );
  }

  void _listener(BuildContext context, SignInState state) {
    if (state.status.isInProgress) {
      ProgressIndicatorDialog<SignInCubit, SignInState>(
        popWhen: (state) => !state.status.isInProgress,
      ).show(context);
    } else if (state.status.isSuccess) {
      showSuccessSnackBar(context, message: 'Successfully signed in!');
    } else if (state.status.isFailure) {
      showErrorSnackBar(
        context,
        message: switch (state.error!) {
          AuthenticationFailure.invalidCredentials =>
            'Please enter valid credentials',
          AuthenticationFailure.userNotFound => 'No user found with this email',
          AuthenticationFailure.networkError =>
            'Network error, please try again later',
          AuthenticationFailure.unknownError =>
            'Unknown error occurred, please try again later',
        },
      );
    }
  }
}
