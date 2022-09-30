import 'package:bloc/bloc.dart';
import 'package:tea_coffee_shop/bloc/category/category_event.dart';
import 'package:tea_coffee_shop/bloc/category/category_state.dart';
import 'package:tea_coffee_shop/models/category.dart';
import 'package:tea_coffee_shop/services/category/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository})
      : super(CategoryInitialState()) {
    on<CategoryLoadEvent>((event, emit) async {
      emit(CategoryLoadingState());

      try {
        final List<Category> categories =
            await categoryRepository.getCategory();
        emit(CategoryLoadedState(categories: categories));
      } catch (_) {
        emit(CategoryErrorState());
      }
    });
  }
}
