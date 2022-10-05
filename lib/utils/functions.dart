import 'package:flutter/material.dart';

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
