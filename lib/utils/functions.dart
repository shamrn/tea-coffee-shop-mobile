import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

Widget getImageWidget(
    {required String? image, required double width, required double height}) {
  return image != null
      ? Image.network(
          image,
          width: width,
          height: height,
        )
      : Image.asset(
          'assets/images/default_product_image.png',
          width: width,
          height: height,
        );
}

Map<String, Color>? getProductColorSet(int index) {
  var sets = Styles.productColorSets;
  return index % 2 == 0 ? sets['firstSet'] : sets['secondSet'];
}
