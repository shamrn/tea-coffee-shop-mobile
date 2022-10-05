import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';
import 'package:tea_coffee_shop/widgets/category_widget.dart';
import 'package:tea_coffee_shop/widgets/product_widget.dart';
import 'package:tea_coffee_shop/widgets/search_widget.dart';
import 'package:tea_coffee_shop/widgets/tea_coffee_link_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: Styles.primaryPadding,
          child: Column(
            children: const <Widget>[
              SearchWidget(),
              SizedBox(height: 20),
              CategoryListViewWidget(),
              SizedBox(height: 40),
              TeaCoffeeLinkWidget(),
              SizedBox(height: 40),
              ProductListViewWidget(),
            ],
          ),
        ),
      ),
    ));
  }
}
