import 'package:tea_coffee_shop/models/product.dart';
import 'package:tea_coffee_shop/services/product/product_provider.dart';

class ProductRepository {
  final ProductProvider _productProvider = ProductProvider();

  Future<List<Product>> getProduct() => _productProvider.getProduct();
}
