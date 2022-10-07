import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/models/product.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/utils/functions.dart';

class ProductCardWidget extends StatelessWidget {
  final double width;
  final double height;

  final Map<String, Color> colorSet;
  final Product product;

  const ProductCardWidget(
      {Key? key,
      required this.colorSet,
      required this.product,
      required this.width,
      required this.height})
      : super(key: key);

  double get _firstContainerMargin => height / 4;

  double get _firstContainerHeight => height - (_firstContainerMargin) - 5;

  double get _imageHeight => height / 1.6;

  double get _secondContainerMargin => _imageHeight - _firstContainerMargin;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
        margin: EdgeInsets.only(top: _firstContainerMargin),
        height: _firstContainerHeight,
        width: width,
        decoration: BoxDecoration(
          color: colorSet['canvas'],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 12,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(top: _secondContainerMargin),
          child: Padding(
            padding:
                const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    product.name,
                    style: TextStyle(
                        color: colorSet['name'],
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 22),
                        color: colorSet['buttonBackground'],
                        child: Text(
                          Texts.buttonOpenProductText,
                          style: TextStyle(
                              color: Styles.primaryOrangeColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          '${product.volume} ${Texts.volumeTypeText}',
                          style: TextStyle(
                              color: Styles.primaryGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('${product.price} ${Texts.currencyShortName}',
                            style: TextStyle(
                                color: Styles.primaryOrangeColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      getImageWidget(image: product.image, width: width, height: _imageHeight)
    ]);
  }
}
