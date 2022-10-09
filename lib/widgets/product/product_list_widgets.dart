import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/models/product.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/widgets/product/product_card_widgets.dart';

abstract class ProductBaseListWidget extends StatelessWidget {
  final List<Product> products;

  const ProductBaseListWidget({Key? key, required this.products})
      : super(key: key);

  Map<String, Color>? getProductColorSet(int index) {
    var sets = Styles.productColorSets;
    return index % 2 == 0 ? sets['firstSet'] : sets['secondSet'];
  }
}

class ProductHomeListWidget extends ProductBaseListWidget {
  const ProductHomeListWidget({Key? key, required products})
      : super(key: key, products: products);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Styles.productHomeListHeight,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ProductHomeCardWidget(
              colorSet: getProductColorSet(index)!,
              product: products[index],
            ),
          );
        },
      ),
    );
  }
}
