import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/online_home_screen/sections/header.dart';
import 'package:weather_app/view/online_home_screen/sections/weather_details.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/routes_constants.dart';
import '../../../constants/text_constants.dart';
import '../../../controller/global_controller.dart';
import '../../../widgets/button.dart';
import '../../widgets/offline_widget.dart';
import 'sections/current_weather.dart';

class OnlineHomeScreen extends GetView<GlobalController> {
  const OnlineHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineWrapper(
      child: Scaffold(
        backgroundColor: MyColors.black,
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
                        const HeaderWidget(),
                        SizedBox(height: 15.h),
                        const CurrentWeather(),
                        SizedBox(height: 15.h),
                        const WeatherDetails(),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            Text('Others',
                                style: AppTextStyle()
                                    .headlineBlue
                                    .copyWith(fontSize: 18.sp)),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: MyColors.blue,
                              size: 25.sp,
                            )
                          ],
                        ),
                        SizedBox(height: 10.sp),
                        MyButton(
                            title: 'Forecast for 5 days', page: forecastScreen),
                        SizedBox(height: 10.sp),
                        MyButton(
                            title: 'Search for any city', page: searchScreen),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
