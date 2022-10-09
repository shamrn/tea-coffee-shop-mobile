import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/models/product.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

abstract class ProductCardBaseWidget extends StatelessWidget {
  final double width;
  final double height;
  final double fontSizeName;
  final double fontSize;

  final Map<String, Color> colorSet;
  final Product product;

  const ProductCardBaseWidget(
      {Key? key,
      required this.colorSet,
      required this.product,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.fontSizeName})
      : super(key: key);

  double get _firstContainerMargin => height / 4;

  double get _firstContainerHeight => height - (_firstContainerMargin);

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
            child: getBody(),
          ),
        ),
      ),
      _getImageWidget(image: product.image, width: width, height: _imageHeight)
    ]);
  }

  Widget getBody();

  Text getName() {
    return Text(
      product.name,
      style: TextStyle(
          color: colorSet['name'],
          fontSize: fontSizeName,
          fontWeight: FontWeight.bold),
    );
  }

  InkWell getBuyButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
        color: colorSet['buttonBackground'],
        child: Text(
          Texts.buttonOpenProductText,
          style: TextStyle(
              color: Styles.primaryOrangeColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Text getVolumeWidget() {
    return Text(
      '${product.volume} ${Texts.volumeTypeText}',
      style: TextStyle(
          color: Styles.primaryGreyColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold),
    );
  }

  Text getPriceWidget() {
    return Text('${product.price} ${Texts.currencyShortName}',
        style: TextStyle(
            color: Styles.primaryOrangeColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold));
  }

  Widget _getImageWidget(
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
}

class ProductHomeCardWidget extends ProductCardBaseWidget {
  ProductHomeCardWidget(
      {Key? key,
      required Map<String, Color> colorSet,
      required Product product})
      : super(
            key: key,
            colorSet: colorSet,
            product: product,
            width: Styles.productHomeListWidth,
            height: Styles.productHomeListHeight,
            fontSizeName: 22,
            fontSize: 16);

  @override
  Widget getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getName(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getBuyButton(),
            Column(
              children: [
                getVolumeWidget(),
                const SizedBox(
                  height: 5,
                ),
                getPriceWidget(),
              ],
            )
          ],
        )
      ],
    );
  }
}

class ProductCardWidget extends ProductCardBaseWidget {
  ProductCardWidget(
      {Key? key,
      required Map<String, Color> colorSet,
      required Product product})
      : super(
            key: key,
            colorSet: colorSet,
            product: product,
            width: Styles.productListWidth,
            height: Styles.productListHeight,
            fontSizeName: 16,
            fontSize: 13);

  @override
  Widget getBody() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getName(),
          getPriceWidget(),
          getVolumeWidget(),
          getBuyButton(),
        ]);
  }
}
