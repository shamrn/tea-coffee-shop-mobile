import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tea_coffee_shop/bloc/bottom_bar/bottom_bar_cubit.dart';
import 'package:tea_coffee_shop/bloc/bottom_bar/bottom_bar_state.dart';
import 'package:tea_coffee_shop/screens/home_screen.dart';
import 'package:tea_coffee_shop/utils/app_constants.dart';

enum BottomBarItems {
  home,
  favorite,
  cart,
  info,
}

class BottomBarNavigator extends StatefulWidget {
  const BottomBarNavigator({Key? key}) : super(key: key);

  @override
  _BottomBarNavigatorState createState() => _BottomBarNavigatorState();
}

class _BottomBarNavigatorState extends State<BottomBarNavigator> {
  static final List<Widget> bottomBarScreens = [
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar:
        BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Styles.primaryOrangeColor,
          unselectedItemColor: Styles.primaryGreenColor,
          iconSize: 28,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
              ),
              label: 'Info',
            ),
          ],
          onTap: (index) {
            BlocProvider.of<BottomBarCubit>(context)
                .getBottomBarItem(BottomBarItems.values[index]);
          },
        );
      },
    ), body:
        BlocBuilder<BottomBarCubit, BottomBarState>(builder: (context, state) {
      return bottomBarScreens[state.index];
    }));
  }
}
