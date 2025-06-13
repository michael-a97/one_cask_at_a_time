import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core.dart';
part 'products_json.dart';

@Injectable(as: ProductDataSource)
class ProductLocalDataSource implements ProductDataSource {
  @override
  Future<Either<ProductLoadingFailureType, List<Product>>> find() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    final productDtos = productsJson.map(Product.fromJson).toList();
    return right(productDtos);
  }
}
