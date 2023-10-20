import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/home_screens/online_home_screen/sections/header_widget.dart';
import 'package:weather_app/view/home_screens/online_home_screen/sections/weather_details.dart';
import '../../../constants/color_constants.dart';
import '../../../controller/home_screen_controller.dart';
import 'sections/current_weather.dart';

class OnlineHomeScreen extends GetView<HomeScreenController> {
  const OnlineHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      // Center(
                      //   child: InkWell(
                      //     onTap: () => Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => SearchScreen(),
                      //         )),
                      //     child: Container(
                      //       height: 50,
                      //       //width: 200,
                      //       decoration: BoxDecoration(
                      //           color: Colors.black54,
                      //           borderRadius: BorderRadius.circular(10)),
                      //       child: const Center(
                      //         child: Text("Search another City",
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.bold)),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
