import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/widgets/product/product_bloc_provider_widgets.dart';

class ProductHomeWidget extends StatelessWidget {
  const ProductHomeWidget({Key? key}) : super(key: key);

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
        const ProductHomeBlocProviderWidget(),
      ],
    );
  }
}
