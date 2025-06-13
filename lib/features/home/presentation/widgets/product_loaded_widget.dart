part of 'home_view.dart';

class ProductLoadedWidget extends StatelessWidget {
  final List<Product> products;

  const ProductLoadedWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () => context.read<ProductsCubit>().load(),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6,
        ),
        padding: const EdgeInsetsGeometry.symmetric(horizontal: Spacing.lg),
        children: [
          ...products.map((product) => _ProductCard(product: product)),
          const Gap(Spacing.lg),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      child: InkWell(
        onTap: () => context.router.push(ProductDetailsRoute(product: product)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(child: Image.asset(Assets.images.product.path)),
              ),
              Text(product.name, style: theme.textTheme.displayMedium),
              Text('${product.year}', style: theme.textTheme.displaySmall),
              Text('112/158', style: theme.textTheme.titleSmall),
              const Gap(Spacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
