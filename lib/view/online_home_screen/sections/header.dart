import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/text_constants.dart';
import '../../../../controller/global_controller.dart';


class HeaderWidget extends GetView<GlobalController> {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("yMMMMd").format(DateTime.now());

    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              controller.city.value,
              style: AppTextStyle().headlineWhite.copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 5.h),
            Text(
              date,
              style: AppTextStyle()
                  .subTitleBlue
                  .copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
    );
  }
}
