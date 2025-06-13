part of 'sign_in_view.dart';

class RecoverPasswordSection extends StatelessWidget {
  const RecoverPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text("Can't sign in?"),
        TextButton(onPressed: () {}, child: const Text('Recover Password')),
      ],
    );
  }
}
