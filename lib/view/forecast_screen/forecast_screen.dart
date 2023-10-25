import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/color_constants.dart';
import 'package:weather_app/view/forecast_screen/sections/chart.dart';
import 'package:weather_app/view/forecast_screen/sections/forecast_details.dart';
import 'package:weather_app/view/forecast_screen/sections/header.dart';
import '../../controller/global_controller.dart';
import '../../widgets/offline_widget.dart';

class ForecastScreen extends GetView<GlobalController> {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineWrapper(
      child: Scaffold(
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
                    padding: EdgeInsets.symmetric(horizontal: 30.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const HeaderForecastWidget(),
                        SizedBox(height: 10.h),
                        const MyChart(),
                        SizedBox(height: 15.h),
                        const ForecastDetails(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
