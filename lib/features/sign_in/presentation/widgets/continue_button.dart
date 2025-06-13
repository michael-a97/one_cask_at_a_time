part of 'sign_in_view.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<SignInCubit>().submit();
      },
      child: const Text('Continue'),
    );
  }
}
