import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

class TeaCoffeeLinkWidget extends StatelessWidget {
  const TeaCoffeeLinkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LinkWidget(
          pathImage: Assets.teaLink,
          title: Texts.teaLinkTitle,
        ),
        LinkWidget(
          pathImage: Assets.coffeeLink,
          title: Texts.coffeeLinkTitle,
        ),
      ],
    );
  }
}

class LinkWidget extends StatelessWidget {
  final String pathImage;
  final String title;

  const LinkWidget({Key? key, required this.pathImage, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              pathImage,
              width: 150,
              height: 150,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.navigate_next_rounded,
                  size: 28,
                  color: Styles.primaryOrangeColor,
                ),
              ],
            ),
          ],
        ));
  }
}
