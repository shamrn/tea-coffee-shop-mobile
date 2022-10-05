import 'package:tea_coffee_shop/models/product.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  List<Product> products;

  ProductLoadedState({required this.products});
}

class ProductErrorState extends ProductState {}
