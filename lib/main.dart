import 'package:flutter/material.dart';
import 'package:tea_coffee_shop/navigators/start_load_navigator.dart';
import 'package:tea_coffee_shop/screens/home_screen.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: Styles.yanoneKafeesatzFont),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const StartLoadNavigator(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
