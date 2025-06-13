part of 'sign_in_view.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      onChanged: (value) => context.read<SignInCubit>().onEmailChanged(value),
      keyboardType: TextInputType.emailAddress,
      onTapUpOutside: (_) => FocusScope.of(context).unfocus(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email cannot be empty';
        }
        return null;
      },
    );
  }
}
