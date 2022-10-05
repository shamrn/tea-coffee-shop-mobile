import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tea_coffee_shop/bloc/product/product_bloc.dart';
import 'package:tea_coffee_shop/bloc/product/product_event.dart';
import 'package:tea_coffee_shop/bloc/product/product_state.dart';
import 'package:tea_coffee_shop/models/product.dart';
import 'package:tea_coffee_shop/services/product/product_repository.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/utils/functions.dart';
import 'package:tea_coffee_shop/widgets/error_message_widget.dart';

const primaryHeight = 500.0;

var colorSets = <String, Map<String, Color>>{
  'firstSet': {
    'canvas': Styles.primaryGreenColor,
    'name': Styles.primaryWhiteColor,
    'buttonBackground': Styles.primaryWhiteColor,
  },
  'secondSet': {
    'canvas': Styles.primaryWhiteColor,
    'name': Styles.primaryGreenColor,
    'buttonBackground': Styles.primaryGreenColor,
  }
};

class ProductListViewWidget extends StatelessWidget {
  const ProductListViewWidget({Key? key}) : super(key: key);

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
                height: primaryHeight,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    Map<String, Color>? colorSet = index % 2 == 0
                        ? colorSets['firstSet']
                        : colorSets['secondSet'];
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: ProductWidget(
                        colorSet: colorSet!,
                        product: state.products[index],
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

class ProductWidget extends StatelessWidget {
  static const _primaryWidth = 260.0;

  final Map<String, Color> colorSet;
  final Product product;

  const ProductWidget({Key? key, required this.colorSet, required this.product})
      : super(key: key);

  double get _firstContainerMargin => primaryHeight / 4;

  double get _firstContainerHeight =>
      primaryHeight - (_firstContainerMargin) - 5;

  double get _imageHeight => primaryHeight / 1.6;

  double get _secondContainerMargin => _imageHeight - _firstContainerMargin;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topCenter, children: [
      Container(
        margin: EdgeInsets.only(top: _firstContainerMargin),
        height: _firstContainerHeight,
        width: _primaryWidth,
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
                        const SizedBox(height: 5,),
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
      getImageWidget(
          image: product.image, width: _primaryWidth, height: _imageHeight)
    ]);
  }
}
