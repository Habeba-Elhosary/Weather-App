import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';
import '../../../controller/home&forecast_screen_controller.dart';
import '../../../model/forecast_model.dart';

class MyChart extends GetView<HomeScreenController> {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final forecast = controller.forecast.value;
      if (forecast.list.isEmpty) {
        return const CircularProgressIndicator();
      }
      return SizedBox(
        width: double.infinity,
        height: 240,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
              labelStyle:AppTextStyle().subTitleBlue.copyWith(fontSize: 10.sp),
              title: AxisTitle(text: 'Day/Hour'),
            ),
            primaryYAxis: NumericAxis(
              labelStyle:AppTextStyle().subTitleBlue.copyWith(fontSize: 10.sp),
              title: AxisTitle(text: 'Temperature (°C)'),
            ),
            series: <LineSeries<ListElement, String>>[
              LineSeries<ListElement, String>(
                dataSource: controller.forecast.value.list,
                xValueMapper: (ListElement data, _) => data.dtTxt,
                yValueMapper: (ListElement data, _) => data.main.temp.round(),
                color: MyColors.blue,
                animationDuration: 2500,
              ),
            ],
          ),
        ),
      );
    });
  }
}

// return Text(controller.forecast.value.list[0].main.temp.round().toString(),style: AppTextStyle().headlineBlue,);
