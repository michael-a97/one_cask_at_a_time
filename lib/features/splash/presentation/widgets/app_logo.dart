part of 'splash_view.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Assets.images.logo.path, height: size, width: size);
  }
}
