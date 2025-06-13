part of 'product_details_view.dart';

class DetailsWidget extends StatelessWidget {
  final Product product;

  const DetailsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsListItem(label: 'Distillery', value: product.distillery),
        DetailsListItem(label: 'Region', value: product.region),
        DetailsListItem(label: 'Country', value: product.country),
        DetailsListItem(label: 'Type', value: product.type),
        DetailsListItem(label: 'Age statement', value: product.ageStatement),
        DetailsListItem(label: 'Filled', value: product.filled),
        DetailsListItem(label: 'Bottled', value: product.bottled),
        DetailsListItem(label: 'Cask Number', value: product.caskNumber),
        DetailsListItem(label: 'ABV', value: product.abv),
        DetailsListItem(label: 'Size', value: product.size),
        DetailsListItem(label: 'Finish', value: product.finish),
      ],
    );
  }
}

class DetailsListItem extends StatelessWidget {
  final String label;
  final String value;

  const DetailsListItem({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.md),
      child: Row(
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Expanded(child: Text(value, textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}
