import 'package:dartz/dartz.dart';

import '../../core.dart';

/// An abstract class that defines the contract for the product repository
abstract class ProductRepository {
  Future<Either<ProductLoadingFailureType, List<Product>>> find();
}
