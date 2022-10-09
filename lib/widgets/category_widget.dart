import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tea_coffee_shop/bloc/category/category_bloc.dart';
import 'package:tea_coffee_shop/bloc/category/category_event.dart';
import 'package:tea_coffee_shop/bloc/category/category_state.dart';
import 'package:tea_coffee_shop/models/category.dart';
import 'package:tea_coffee_shop/services/category/category_repository.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/widgets/error_message_widget.dart';

class CategoryListViewWidget extends StatelessWidget {
  const CategoryListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            CategoryBloc(categoryRepository: CategoryRepository())
              ..add(CategoryLoadEvent()),
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return CircularProgressIndicator(
                  color: Styles.primaryOrangeColor);
            } else if (state is CategoryLoadedState) {
              return SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CategoryWidget(
                          category: state.categories[index]),
                    );
                  },
                ),
              );
            } else if (state is CategoryErrorState) {
              return const ErrorMessageWidget();
            }
            return CircularProgressIndicator(color: Styles.primaryOrangeColor);
          },
        ));
  }
}

class CategoryWidget extends StatelessWidget {
  static const borderRadiusValue = 50.0;

  final Category category;

  const CategoryWidget({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/product_screen');
      },
      splashFactory: InkRipple.splashFactory,
      borderRadius: BorderRadius.circular(borderRadiusValue),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Styles.primaryLightGreyColor),
          borderRadius: BorderRadius.circular(borderRadiusValue),
        ),
        child: Center(
            child: Text(category.name,
                style: TextStyle(
                    fontSize: 16,
                    color: Styles.primaryGreenColor,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}
