import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tea_coffee_shop/bloc/product/product_bloc.dart';
import 'package:tea_coffee_shop/bloc/product/product_event.dart';
import 'package:tea_coffee_shop/bloc/product/product_state.dart';
import 'package:tea_coffee_shop/services/product/product_repository.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/widgets/error_message_widget.dart';
import 'package:tea_coffee_shop/widgets/product/product_list_widget.dart';

class ProductBlocProviderWidget extends StatelessWidget {
  final Axis scrollDirection;

  const ProductBlocProviderWidget({Key? key, required this.scrollDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(productRepository: ProductRepository())
        ..add(ProductLoadEvent()),
      child: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductLoadingState) {
          return CircularProgressIndicator(color: Styles.primaryOrangeColor);
        } else if (state is ProductLoadedState) {
          return ProductListWidget(
            scrollDirection: scrollDirection,
            products: state.products,
          );
        } else if (state is ProductErrorState) {
          return const ErrorMessageWidget();
        }
        return CircularProgressIndicator(color: Styles.primaryOrangeColor);
      }),
    );
  }
}
