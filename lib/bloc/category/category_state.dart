import 'package:tea_coffee_shop/models/category.dart';

abstract class CategoryState {}

class CategoryInitialState extends CategoryState {}

class CategoryLoadingState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  List<Category> categories;

  CategoryLoadedState({required this.categories});
}

class CategoryErrorState extends CategoryState {}
