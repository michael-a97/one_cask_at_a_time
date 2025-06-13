import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/core.dart';
import 'widgets/product_details_view.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ProductDetailsView(product: product);
  }
}
