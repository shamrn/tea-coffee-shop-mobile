import 'package:bloc/bloc.dart';
import 'package:tea_coffee_shop/bloc/bottom_bar/bottom_bar_state.dart';
import 'package:tea_coffee_shop/navigators/bottom_bar_navigator.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(const BottomBarState(BottomBarItems.home, 0));

  void getBottomBarItem(BottomBarItems item) {
    switch (item) {
      case BottomBarItems.home:
        emit(const BottomBarState(BottomBarItems.home, 0));
        break;
      case BottomBarItems.favorite:
        // TODO: Handle this case.
        break;
      case BottomBarItems.cart:
        // TODO: Handle this case.
        break;
      case BottomBarItems.info:
        // TODO: Handle this case.
        break;
    }
  }
}
