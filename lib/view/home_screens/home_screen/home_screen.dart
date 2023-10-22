import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:weather_app/constants/color_constants.dart';
import '../../../controller/home&forecast_screen_controller.dart';
import '../offline_home_screen/offline_home_screen.dart';
import '../online_home_screen/online_home_screen.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return const OnlineHomeScreen();
          } else {
            return const OfflineHomeScreen();
          }
        },
        child: const Center(
          child: CircularProgressIndicator(color: MyColors.blue),
        ),
      ),
    );
  }
}
