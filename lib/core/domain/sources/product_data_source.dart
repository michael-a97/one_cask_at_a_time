import 'package:dartz/dartz.dart';

import '../../core.dart';

enum ProductLoadingFailureType { networkError, serverError, unknownError }

/// An abstract class that defines the contract for a local data source
abstract class ProductDataSource {
  Future<Either<ProductLoadingFailureType, List<Product>>> find();
}
