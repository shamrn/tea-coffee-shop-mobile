import 'package:equatable/equatable.dart';
import 'package:tea_coffee_shop/navigators/bottom_bar_navigator.dart';

class BottomBarState extends Equatable {
  final BottomBarItems item;
  final int index;

  const BottomBarState(this.item, this.index);

  @override
  List<Object> get props => [item, index];
}
