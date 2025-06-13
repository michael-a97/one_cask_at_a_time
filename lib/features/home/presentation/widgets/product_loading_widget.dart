part of 'home_view.dart';

class ProductLoadingWidget extends StatelessWidget {
  const ProductLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: ProgressIndicatorWidget());
  }
}
