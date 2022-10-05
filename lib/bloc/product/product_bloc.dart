import 'package:bloc/bloc.dart';
import 'package:tea_coffee_shop/bloc/product/product_event.dart';
import 'package:tea_coffee_shop/bloc/product/product_state.dart';
import 'package:tea_coffee_shop/models/product.dart';
import 'package:tea_coffee_shop/services/product/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository})
      : super(ProductInitialState()) {
    on<ProductLoadEvent>((event, emit) async {
      emit(ProductLoadingState());

      try {
        final List<Product> products = await productRepository.getProduct();
        emit(ProductLoadedState(products: products));
      } catch (_) {
        emit(ProductErrorState());
      }
    });
  }
}
