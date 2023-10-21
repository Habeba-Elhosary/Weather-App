// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import '../../../controller/home_screen_controller.dart';
//
// class ForecastChart extends GetView<HomeScreenController> {
//   const ForecastChart({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/text_constants.dart';
import 'package:weather_app/controller/home_screen_controller.dart';

class MyChart extends GetView<HomeScreenController> {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final forecast = controller.forecast.value;
      if (forecast.list.isEmpty) {
        return const CircularProgressIndicator();
      }
      return Text(controller.forecast.value.list[0].main.temp.round().toString(),style: AppTextStyle().headlineBlue,);
    });
  }
}
