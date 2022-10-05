import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tea_coffee_shop/bloc/bottom_bar/bottom_bar_cubit.dart';
import 'package:tea_coffee_shop/navigators/bottom_bar_navigator.dart';
import 'package:tea_coffee_shop/navigators/start_load_navigator.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomBarCubit>(
      create: (context) => BottomBarCubit(),
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: Styles.montserratFont,
            canvasColor: Styles.primaryWhiteColor),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const StartLoadNavigator(),
          '/bottom_bar_navigator': (context) => const BottomBarNavigator(),
        },
      ),
    );
  }
}
