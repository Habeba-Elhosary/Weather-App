import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';
import '../../../controller/home_screen_controller.dart';

class HeaderForecastWidget extends GetView<HomeScreenController> {
  const HeaderForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.stacked_line_chart,
          color: MyColors.blue,
          size: 25.sp,
        ),
        SizedBox(width: 10.w),
        Text(
          'Forecast for ',
          style: AppTextStyle()
              .headlineWhite
              .copyWith(fontSize: 17.sp),
          textAlign: TextAlign.center,
        ),
        Text(
          ' 5 days',
          style: AppTextStyle()
              .headlineBlue
              .copyWith(fontSize: 17.sp),
          textAlign: TextAlign.center,
        ),
        Text(
          ' / ',
          style: AppTextStyle()
              .headlineWhite
              .copyWith(fontSize: 17.sp),
          textAlign: TextAlign.center,
        ),
        Text(
          ' 3 hours',
          style: AppTextStyle()
              .headlineBlue
              .copyWith(fontSize: 17.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
