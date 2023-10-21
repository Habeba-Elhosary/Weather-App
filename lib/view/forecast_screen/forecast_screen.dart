import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/color_constants.dart';
import 'package:weather_app/view/forecast_screen/sections/chart.dart';
import 'package:weather_app/view/forecast_screen/sections/header.dart';
import '../../controller/home_screen_controller.dart';

class ForecastScreen extends GetView<HomeScreenController> {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
      appBar: AppBar(
        backgroundColor: MyColors.black,
      ),
      body: Obx(
        () => controller.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(color: MyColors.blue),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.sp, vertical: 75.sp),
                  child: Column(
                    children: [
                      const HeaderForecastWidget(),
                      SizedBox(height: 10.h),
                      const MyChart(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
