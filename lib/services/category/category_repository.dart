import 'package:tea_coffee_shop/models/category.dart';
import 'package:tea_coffee_shop/services/category/category_provider.dart';

class CategoryRepository {
  final CategoryProvider _categoryProvider = CategoryProvider();
  Future<List<Category>> getCategory() => _categoryProvider.getCategory();
}
