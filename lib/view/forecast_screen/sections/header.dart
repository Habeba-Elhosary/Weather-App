import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';
import '../../../controller/global_controller.dart';

class HeaderForecastWidget extends GetView<GlobalController> {
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
          size: 20.sp,
        ),
        SizedBox(width: 5.w),
        Text(
          'Forecast for ',
          style: AppTextStyle()
              .headlineWhite
              .copyWith(fontSize: 15.sp),
          textAlign: TextAlign.center,
        ),
        Text(
          ' 5 days',
          style: AppTextStyle()
              .headlineBlue
              .copyWith(fontSize: 15.sp),
          textAlign: TextAlign.center,
        ),
        Text(
          ' / ',
          style: AppTextStyle()
              .headlineWhite
              .copyWith(fontSize: 15.sp),
          textAlign: TextAlign.center,
        ),
        Text(
          ' 3 hours',
          style: AppTextStyle()
              .headlineBlue
              .copyWith(fontSize: 15.sp),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
