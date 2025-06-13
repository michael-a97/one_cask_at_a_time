import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _localDataSource;

  ProductRepositoryImpl(this._localDataSource);

  @override
  Future<Either<ProductLoadingFailureType, List<Product>>> find() async {
    return _localDataSource.find();
  }
}
