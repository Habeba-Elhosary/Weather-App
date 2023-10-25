import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/text_constants.dart';
import '../../../controller/global_controller.dart';
import '../../../model/forecast_model.dart';

class ForecastDetails extends GetView<GlobalController> {
  const ForecastDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<ListElement> data = controller.forecast.value.list;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('More Details',
                style: AppTextStyle().headlineBlue.copyWith(fontSize: 15.sp)),
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
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          margin: EdgeInsets.symmetric(vertical: 2.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r), color: MyColors.white),
          child: Row(
            children: [
              Text(
                "Day-Hour",
                style: AppTextStyle().headlineBlue.copyWith(fontSize: 12.sp),
              ),
              const Spacer(),
              Text(
                "Max Temp",
                style: AppTextStyle().headlineBlue.copyWith(fontSize: 12.sp),
              ),
              const Spacer(),
              Text(
                "Min Temp",
                style: AppTextStyle().headlineBlue.copyWith(fontSize: 12.sp),
              ),
              const Spacer(),
              Text(
                "Humidity",
                style: AppTextStyle().headlineBlue.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 350.sp,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 40 ,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.sp, vertical: 10.sp),
                    margin: EdgeInsets.symmetric(vertical: 2.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: MyColors.white),
                    child: Row(
                      children: [
                        Text(
                          data[index].dtTxt,
                          style: AppTextStyle().subTitleWhite1.copyWith(
                              color: MyColors.lightGrey, fontSize: 12.sp),
                        ),
                        const Spacer(),
                        Text(
                          "${data[index].main.tempMax.round().toString()}°C",
                          style: AppTextStyle().subTitleWhite1.copyWith(
                              color: MyColors.lightGrey, fontSize: 12.sp),
                        ),
                        const Spacer(),
                        Text(
                          "${data[index].main.tempMin.round().toString()}°C",
                          style: AppTextStyle().subTitleWhite1.copyWith(
                              color: MyColors.lightGrey, fontSize: 12.sp),
                        ),
                        const Spacer(),
                        Text(
                          "${data[index].main.humidity.round().toString()}%",
                          style: AppTextStyle().subTitleWhite1.copyWith(
                              color: MyColors.lightGrey, fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
