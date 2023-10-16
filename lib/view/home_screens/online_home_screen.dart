import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/color_constants.dart';
import '../../controller/home_screen_controller.dart';
import '../../widgets/current_weather.dart';
import '../../widgets/header_widget.dart';
import '../../widgets/weatherDetails.dart';

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
                      EdgeInsets.symmetric(horizontal: 30.sp, vertical: 70.sp),
                  child: Column(
                    children: [
                      const HeaderWidget(),
                      SizedBox(height: 20.h),
                      const CurrentWeather(),
                      SizedBox(height: 20.h),
                      const WeatherDetail(),
                      SizedBox(height: 20.h),
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
