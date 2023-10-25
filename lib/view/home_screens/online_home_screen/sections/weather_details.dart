import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/text_constants.dart';
import '../../../../controller/global_controller.dart';

class WeatherDetails extends GetView<GlobalController> {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Weather Details',
                style: AppTextStyle().headlineBlue.copyWith(fontSize: 18.sp)),
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
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                color: MyColors.grey,
                border: Border.all(
                    color: MyColors.lightGrey,
                    width: 2.w,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Obx(
                () {
                  final weather = controller.weather;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/icons/windSpeed.png",
                        height: 50.h,
                      ),
                      SizedBox(height: 5.h),
                      Text('Wind Speed',
                          style: AppTextStyle()
                              .headlineWhite
                              .copyWith(fontSize: 12.sp)),
                      SizedBox(height: 5.h),
                      Wrap(
                        children: [
                          Text(
                            weather.value.wind.speed.round().toString(),
                            style: AppTextStyle()
                                .headlineWhite
                                .copyWith(fontSize: 15.sp),
                          ),
                          Text(
                            ' km/h',
                            style: AppTextStyle()
                                .subTitleBlue
                                .copyWith(fontSize: 15.sp),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                color: MyColors.grey,
                border: Border.all(
                    color: MyColors.lightGrey,
                    width: 2.w,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Obx(
                () {
                  final weather = controller.weather;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/icons/clouds.png",
                        height: 50.h,
                      ),
                      SizedBox(height: 5.h),
                      Text('Clouds',
                          style: AppTextStyle()
                              .headlineWhite
                              .copyWith(fontSize: 12.sp)),
                      SizedBox(height: 5.h),
                      Wrap(
                        children: [
                          Text(
                            weather.value.clouds.all.toString(),
                            style: AppTextStyle()
                                .headlineWhite
                                .copyWith(fontSize: 15.sp),
                          ),
                          Text(
                            ' %',
                            style: AppTextStyle()
                                .subTitleBlue
                                .copyWith(fontSize: 15.sp),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                color: MyColors.grey,
                border: Border.all(
                    color: MyColors.lightGrey,
                    width: 2.w,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Obx(
                () {
                  final weather = controller.weather;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/icons/humidity.png",
                        height: 50.h,
                      ),
                      SizedBox(height: 5.h),
                      Text('Humidity',
                          style: AppTextStyle()
                              .headlineWhite
                              .copyWith(fontSize: 12.sp)),
                      SizedBox(height: 5.h),
                      Wrap(
                        children: [
                          Text(
                            weather.value.main.humidity.toString(),
                            style: AppTextStyle()
                                .headlineWhite
                                .copyWith(fontSize: 15.sp),
                          ),
                          Text(
                            ' %',
                            style: AppTextStyle()
                                .subTitleBlue
                                .copyWith(fontSize: 15.sp),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10.sp),
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                color: MyColors.grey,
                border: Border.all(
                  color: MyColors.lightGrey,
                  width: 2.w,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Obx(
                    () {
                  final weather = controller.weather;
                  var sunriseTimestamp = weather.value.sys.sunrise * 1000;
                  var sunriseDate = DateTime.fromMillisecondsSinceEpoch(sunriseTimestamp);
                  var sunriseHours = sunriseDate.hour;
                  var sunriseMinutes = sunriseDate.minute;
                  String amPm = sunriseHours >= 12 ? "PM" : "AM";
                  if (sunriseHours > 12) {
                    sunriseHours -= 12;
                  }
                  return Wrap(
                    children: [
                      Text(
                        'Sunrise => ',
                        style: AppTextStyle().headlineBlue.copyWith(fontSize: 12.sp),
                      ),
                      Text(
                        '$sunriseHours:${sunriseMinutes.toString().padLeft(2, '0')} $amPm',
                        style: AppTextStyle().headlineWhite.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  );
                },
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 8.sp),
              decoration: BoxDecoration(
                color: MyColors.grey,
                border: Border.all(
                  color: MyColors.lightGrey,
                  width: 2.w,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Obx(
                    () {
                  final weather = controller.weather;
                  var sunsetTimestamp = weather.value.sys.sunset * 1000;
                  var sunsetDate = DateTime.fromMillisecondsSinceEpoch(sunsetTimestamp);
                  var sunsetHours = sunsetDate.hour;
                  var sunsetMinutes = sunsetDate.minute;
                  String amPm = sunsetHours >= 12 ? "PM" : "AM";
                  if (sunsetHours > 12) {
                    sunsetHours -= 12;
                  }
                  return Wrap(
                    children: [
                      Text(
                        'Sunrise => ',
                        style: AppTextStyle().headlineBlue.copyWith(fontSize: 12.sp),
                      ),
                      Text(
                        '$sunsetHours:${sunsetMinutes.toString().padLeft(2, '0')} $amPm',
                        style: AppTextStyle().headlineWhite.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
