part of 'home_view.dart';

class ProductFailureWidget extends StatelessWidget {
  final String message;

  const ProductFailureWidget({
    super.key,
    this.message = 'Failed to load products',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.xxl),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(Spacing.xxxl),
            Text(message, textAlign: TextAlign.center),
            const Gap(Spacing.xxl),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.read<ProductsCubit>().load(),
                child: const Text('Try again'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
