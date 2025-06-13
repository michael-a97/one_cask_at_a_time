part of 'sign_in_view.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({super.key});

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      onChanged: (value) => context.read<SignInCubit>().onPasswordChanged(value),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
          icon: Icon(
            obscurePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
          ),
        ),
      ),
      obscureText: obscurePassword,
    );
  }
}
