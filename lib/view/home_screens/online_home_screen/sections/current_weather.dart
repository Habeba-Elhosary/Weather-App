import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/text_constants.dart';
import '../../../../controller/home_screen_controller.dart';

class CurrentWeather extends GetView<HomeScreenController> {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final weather = controller.weather.value;
        if (weather.weather.isEmpty) {
          return const CircularProgressIndicator();
        }
        return Container(
          padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 45.sp),
          decoration: BoxDecoration(
            color: MyColors.grey,
            border: Border.all(
                color: MyColors.lightGrey,
                width: 2.w,
                style: BorderStyle.solid),
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
                      Text(
                          controller.weather.value.main.temp.round().toString(),
                          style: AppTextStyle()
                              .headlineWhite
                              .copyWith(fontSize: 35.sp)),
                      Padding(
                        padding: EdgeInsets.only(bottom: 18.sp),
                        child: Text("°C",
                            style: AppTextStyle()
                                .headlineBlue
                                .copyWith(fontSize: 18.sp)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    controller.weather.value.weather[0].description,
                    style:
                        AppTextStyle().subTitleWhite1.copyWith(fontSize: 25.sp),
                  ),
                  SizedBox(
                    height: 7.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('Max',
                              style: AppTextStyle()
                                  .headlineBlue
                                  .copyWith(fontSize: 15.sp)),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Row(
                            children: [
                              Text(
                                controller.weather.value.main.tempMax
                                    .round()
                                    .toString(),
                                style: AppTextStyle()
                                    .subTitleWhite1
                                    .copyWith(fontSize: 15.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.sp),
                                child: Text(
                                  "°C",
                                  style: AppTextStyle()
                                      .subTitleBlue
                                      .copyWith(fontSize: 12.sp),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 10.w),
                      Material(
                        child: VerticalDivider(
                          color: MyColors.blue,
                          width: 1.w,
                          endIndent: 35,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        children: [
                          Text('Min',
                              style: AppTextStyle()
                                  .headlineBlue
                                  .copyWith(fontSize: 15.sp)),
                          SizedBox(
                            height: 5.sp,
                          ),
                          Row(
                            children: [
                              Text(
                                controller.weather.value.main.tempMin
                                    .round()
                                    .toString(),
                                style: AppTextStyle()
                                    .subTitleWhite1
                                    .copyWith(fontSize: 15.sp),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5.sp),
                                child: Text(
                                  "°C",
                                  style: AppTextStyle()
                                      .subTitleBlue
                                      .copyWith(fontSize: 12.sp),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
