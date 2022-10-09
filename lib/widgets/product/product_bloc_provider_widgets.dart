import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tea_coffee_shop/bloc/product/product_bloc.dart';
import 'package:tea_coffee_shop/bloc/product/product_event.dart';
import 'package:tea_coffee_shop/bloc/product/product_state.dart';
import 'package:tea_coffee_shop/models/product.dart';
import 'package:tea_coffee_shop/services/product/product_repository.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/widgets/error_message_widget.dart';
import 'package:tea_coffee_shop/widgets/product/product_list_widgets.dart';

abstract class ProductBaseBlocProviderWidget extends StatelessWidget {
  const ProductBaseBlocProviderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(productRepository: ProductRepository())
        ..add(ProductLoadEvent()),
      child: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductLoadingState) {
          return CircularProgressIndicator(color: Styles.primaryOrangeColor);
        } else if (state is ProductLoadedState) {
          return getProductListWidget(products: state.products);
        } else if (state is ProductErrorState) {
          return const ErrorMessageWidget();
        }
        return CircularProgressIndicator(color: Styles.primaryOrangeColor);
      }),
    );
  }

  ProductBaseListWidget getProductListWidget({required List<Product> products});
}

class ProductHomeBlocProviderWidget extends ProductBaseBlocProviderWidget {
  const ProductHomeBlocProviderWidget({Key? key}) : super(key: key);

  @override
  ProductBaseListWidget getProductListWidget(
      {required List<Product> products}) {
    return ProductHomeListWidget(products: products);
  }
}
