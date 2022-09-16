import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Images.splashScreen,
      fit: BoxFit.fill,
    );
  }
}
