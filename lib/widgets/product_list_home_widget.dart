import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tea_coffee_shop/bloc/product/product_bloc.dart';
import 'package:tea_coffee_shop/bloc/product/product_event.dart';
import 'package:tea_coffee_shop/bloc/product/product_state.dart';
import 'package:tea_coffee_shop/services/product/product_repository.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/utils/functions.dart';
import 'package:tea_coffee_shop/widgets/error_message_widget.dart';
import 'package:tea_coffee_shop/widgets/product_base_widget.dart';

class ProductListHomeViewWidget extends StatelessWidget {
  const ProductListHomeViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Texts.firstProductSectionTitle,
              style: Styles.productTitleTextStyle,
            ),
            InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      Texts.firstProductSectionButton,
                      style: Styles.productTitleTextStyle,
                    ),
                    Icon(
                      Icons.navigate_next_rounded,
                      color: Styles.primaryOrangeColor,
                    ),
                  ],
                )),
          ],
        ),
        const SizedBox(height: 10),
        BlocProvider(
          create: (context) =>
              ProductBloc(productRepository: ProductRepository())
                ..add(ProductLoadEvent()),
          child:
              BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductLoadingState) {
              return CircularProgressIndicator(
                  color: Styles.primaryOrangeColor);
            } else if (state is ProductLoadedState) {
              return SizedBox(
                height: Styles.productHomeListHeight,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: ProductWidget(
                        colorSet: getProductColorSet(index)!,
                        product: state.products[index],
                        width: Styles.productHomeListWidth,
                        height: Styles.productHomeListHeight,
                      ),
                    );
                  },
                ),
              );
            } else if (state is ProductErrorState) {
              return const ErrorMessageWidget();
            }
            return CircularProgressIndicator(color: Styles.primaryOrangeColor);
          }),
        ),
      ],
    );
  }
}
