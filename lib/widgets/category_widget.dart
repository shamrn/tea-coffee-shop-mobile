import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tea_coffee_shop/bloc/category/category_bloc.dart';
import 'package:tea_coffee_shop/bloc/category/category_event.dart';
import 'package:tea_coffee_shop/bloc/category/category_state.dart';
import 'package:tea_coffee_shop/services/category/category_repository.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/widgets/error_message_widget.dart';

class CategoriesListViewWidget extends StatefulWidget {
  const CategoriesListViewWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesListViewWidget> createState() =>
      _CategoriesListViewWidgetState();
}

class _CategoriesListViewWidgetState extends State<CategoriesListViewWidget> {
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
                          categoryName: state.categories[index].name),
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

class CategoryWidget extends StatefulWidget {
  final String categoryName;

  const CategoryWidget({Key? key, required this.categoryName})
      : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  static const borderRadiusValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashFactory: InkRipple.splashFactory,
      borderRadius: BorderRadius.circular(borderRadiusValue),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Styles.primaryLightGreyColor),
          borderRadius: BorderRadius.circular(borderRadiusValue),
        ),
        child: Center(
            child: Text(widget.categoryName,
                style: TextStyle(
                    fontSize: 16,
                    color: Styles.primaryGreenColor,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}
