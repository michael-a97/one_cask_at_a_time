import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';

part 'product_state.dart';

@Injectable()
class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository _productRepository;

  ProductsCubit(this._productRepository) : super(const ProductsInitial());

  Future<void> load() async {
    emit(const ProductsLoading());
    final response = await _productRepository.find();
    emit(response.fold(ProductsFailure.new, ProductsLoaded.new));
  }
}
