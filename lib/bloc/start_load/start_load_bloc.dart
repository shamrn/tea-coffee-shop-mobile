import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tea_coffee_shop/bloc/start_load/start_load_event.dart';
import 'package:tea_coffee_shop/bloc/start_load/start_load_state.dart';

class StartLoadBloc extends Bloc<StartLoadEvent, StartLoadState> {
  StartLoadBloc() : super(StartLoadInitialState()) {
    on<StartLoadBeginEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(StartLoadLoadedState());
    });
  }
}
