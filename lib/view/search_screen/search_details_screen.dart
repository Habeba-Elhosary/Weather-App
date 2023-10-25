import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/color_constants.dart';
import 'package:weather_app/constants/text_constants.dart';
import 'package:weather_app/view/search_screen/sections/SearchDetailsWidget.dart';
import '../../constants/routes_constants.dart';
import '../../controller/global_controller.dart';

class SearchDetailsScreen extends GetView<GlobalController> {
  const SearchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("yMMMMd").format(DateTime.now());

    return Obx(
      () {
        if (controller.weather2.value.cod != 200) {
          return Scaffold(
            backgroundColor: MyColors.black,
            appBar: AppBar(
              backgroundColor: MyColors.black,
              actions: [
                IconButton(onPressed: ()=>Get.toNamed(homeScreen), icon:const Icon(Icons.home,color: MyColors.white,))
              ],

            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('404',
                      style: AppTextStyle().headlineBlue.copyWith(fontSize: 50.sp)),
                  SizedBox(height:5.h),
                  Text('City Not Found',
                      style: AppTextStyle().subTitleBlue.copyWith(fontSize: 25.sp)),
                ],
              ),
            ),
          );
        }
        else {
          if (controller.weather2.value.weather.isEmpty) {
            return const CircularProgressIndicator(color: MyColors.blue);
          }
          return Scaffold(
            backgroundColor: MyColors.black,
            appBar: AppBar(
              backgroundColor: MyColors.black,
              actions: [
                IconButton(onPressed: ()=>Get.toNamed(homeScreen), icon:const Icon(Icons.home,color: MyColors.white,))
              ],

            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    controller.weather2.value.name,
                    style:
                        AppTextStyle().headlineWhite.copyWith(fontSize: 30.sp),
                  ),
                  SizedBox(height: 5.sp),
                  Text(
                    date,
                    style: AppTextStyle()
                        .subTitleBlue
                        .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.sp),
                  Image.asset(
                    controller.weather2.value.weather[0].path,
                    height: 70.h,
                  ),
                  SizedBox(height: 5.sp),
                  const Divider(
                    color: MyColors.lightGrey,
                  ),
                  SizedBox(height: 5.sp),
                  Row(
                    children: [
                      Text('Weather Details',
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
                  SizedBox(height: 20.sp),
                  const Expanded(child: SearchDetailsWidget()),
                  SizedBox(height: 20.sp),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
