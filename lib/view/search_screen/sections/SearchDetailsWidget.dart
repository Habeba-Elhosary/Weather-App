import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';
import '../../../controller/global_controller.dart';

class SearchDetailsWidget extends GetView<GlobalController> {
  const SearchDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List weatherDetailsList = [
      {
        "title": "Description",
        "response": controller.weather2.value.weather[0].description.toString(),
      },
      {
        "title": "Temp",
        "response":
            "${controller.weather2.value.main.temp.round().toString()}°C",
      },
      {
        "title": "Max Temp",
        "response":
            "${controller.weather2.value.main.tempMax.round().toString()}°C",
      },
      {
        "title": "Min Temp",
        "response":
            "${controller.weather2.value.main.tempMin.round().toString()}°C",
      },
      {
        "title": "Humidity",
        "response":
            "${controller.weather2.value.main.humidity.round().toString()}%",
      },
      {
        "title": "Wind Speed",
        "response":
            "${controller.weather2.value.wind.speed.round().toString()}km/h",
      },
      {
        "title": "Clouds",
        "response":
            "${controller.weather2.value.clouds.all.round().toString()}%",
      },
    ];

      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: weatherDetailsList.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 22.sp,vertical: 15.sp),
          width: 90.sp,
          margin: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
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
              Text("${weatherDetailsList[index]["title"]}",
                  style:
                      AppTextStyle().headlineWhite.copyWith(fontSize: 13.sp)),
              const Spacer(),
              Text("${weatherDetailsList[index]["response"]}",
                  style:
                      AppTextStyle().headlineWhite.copyWith(fontSize: 13.sp)),
            ],
          ),
        ),
      );

  }
}
