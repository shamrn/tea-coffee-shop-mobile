import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/models/product.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/utils/functions.dart';
import 'package:tea_coffee_shop/widgets/product/product_card_widget.dart';

class ProductListWidget extends StatelessWidget {
  final Axis scrollDirection;
  final List<Product> products;

  const ProductListWidget(
      {Key? key, required this.scrollDirection, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Styles.productHomeListHeight,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: scrollDirection,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ProductCardWidget(
              colorSet: getProductColorSet(index)!,
              product: products[index],
              width: Styles.productHomeListWidth,
              height: Styles.productHomeListHeight,
            ),
          );
        },
      ),
    );
    ;
  }
}
