import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constants/color_constants.dart';
import '../constants/text_constants.dart';
import '../controller/home_screen_controller.dart';

class CurrentWeather extends GetView<HomeScreenController> {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 45.sp),
        decoration: BoxDecoration(
          color: MyColors.grey,
          border: Border.all(
              color: MyColors.lightGrey, width: 2.w, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              controller.weather.value.weather[0].path,
              height: 70.h,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('${controller.weather.value.main.temp.round()}',
                        style: AppTextStyle()
                            .headlineWhite
                            .copyWith(fontSize: 35.sp)),
                    Padding(
                      padding: EdgeInsets.only(bottom: 18.sp),
                      child: Text("°C",
                          style: AppTextStyle()
                              .headlineWhite
                              .copyWith(color: MyColors.blue, fontSize: 17.sp)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Text(
                  controller.weather.value.weather[0].description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 5.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Max',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          controller.weather.value.main.tempMax
                              .round()
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width:10.w),
                    Material(
                      child: VerticalDivider(
                        color: MyColors.blue,
                        width: 2.w,
                        endIndent: 35,
                      ),
                    ),
                    SizedBox(width:10.w),
                    Column(
                      children: [
                        const Text(
                          'Min',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          controller.weather.value.main.tempMin
                              .round()
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ],
                ),

              ],
            ),

          ],
        ),
      );
    });
  }
}

// Image.asset(
// // "assets/weather/${controller.weather.value.weather[0].icon}.png",
// controller.weather.value.weather[0].path,
// height: Get.height * .20,
// ),
// const SizedBox(
// height: 10,
// ),
// Container(
// height: 1,
// width: 150,
// color: Colors.white,
// ),
// Padding(
// padding: EdgeInsets.only(left: Get.height * .03),
// child: Row(
// // crossAxisAlignment: WrapCrossAlignment.values[0],
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// '${controller.weather.value.main.temp.round()}',
// style: const TextStyle(
// color: Colors.white,
// fontSize: 100,
// fontWeight: FontWeight.bold),
// ),
// Padding(
// padding: EdgeInsets.only(bottom: Get.height * .08),
// child: const Text(
// "°C",
// style: TextStyle(
// color: Colors.blue,
// fontSize: 20,
// fontWeight: FontWeight.bold),
// ),
// ),
// ],
// ),
// ),
// Text(
// controller.weather.value.weather[0].description,
// style: const TextStyle(
// color: Colors.white,
// fontSize: 30,
// ),
// ),
// ],
// );
