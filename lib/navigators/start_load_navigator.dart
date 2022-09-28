import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tea_coffee_shop/bloc/start_load/start_load_bloc.dart';
import 'package:tea_coffee_shop/bloc/start_load/start_load_event.dart';
import 'package:tea_coffee_shop/bloc/start_load/start_load_state.dart';
import 'package:tea_coffee_shop/screens/splash_screen.dart';

class StartLoadNavigator extends StatelessWidget {
  const StartLoadNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => StartLoadBloc()..add(StartLoadBeginEvent()),
        child: BlocBuilder<StartLoadBloc, StartLoadState>(
            builder: (context, state) {
          if (state is StartLoadLoadedState) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/bottom_bar_navigator', (Route<dynamic> route) => false);
            });
          }
          return const SplashScreen();
        }));
  }
}
