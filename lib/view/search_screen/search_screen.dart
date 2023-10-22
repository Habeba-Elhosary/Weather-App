import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/routes_constants.dart';
import 'package:weather_app/constants/text_constants.dart';
import '../../constants/color_constants.dart';
import '../../controller/search_screen_controller.dart';
import 'package:shimmer/shimmer.dart';

class SearchScreen extends GetView<SearchScreenController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.black,
      ),
      backgroundColor: MyColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 40.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: MyColors.blue,
                highlightColor: MyColors.white,
                child: Text('Let\'s search !',
                    textAlign: TextAlign.center,
                    style: AppTextStyle().headlineBlue),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextField(
                controller: textController,
                style: AppTextStyle().subTitleBlue.copyWith(
                    fontSize: 15.sp,
                    color: MyColors.white,
                    fontWeight: FontWeight.w400),
                onSubmitted: (value) {
                  controller.searchText.value = value;
                  if (value.isEmpty) {
                    controller.weatherSearch.clear();
                  }
                  else {
                    controller.fetchCityResults(value);
                    Get.toNamed(searchDetailsScreen);
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined,
                      size: 25.sp, color: MyColors.blue),
                  filled: true,
                  fillColor: MyColors.grey,
                  labelText: "Enter the city name ",
                  labelStyle:
                      AppTextStyle().subTitleBlue.copyWith(fontSize: 15.sp),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.w,
                      color: MyColors.lightGrey,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.w,
                      color: MyColors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 70.h,
              ),
              Image.asset("assets/images/search.png"),

              // Expanded(
              //   child: Obx(() {
              //     if (controller.searchText.value.isEmpty) {
              //       return Text('Search any city weather...');
              //     } else if (controller.weatherSearch.isEmpty) {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     } else if (controller.cityNotFound.value) {
              //       return Center(
              //         child: Text('City not found'),
              //       );
              //     } else {
              //       return ListView.separated(
              //         itemCount: controller.weatherSearch.length,
              //         separatorBuilder:
              //             (BuildContext context, int index) {
              //           // Create a space separator between items
              //           return SizedBox(
              //               height: Get.height *
              //                   .008); // Adjust the height as needed
              //         },
              //         itemBuilder: (context, index) {
              //           final weather = controller.weatherSearch[index];
              //           return Container(
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10),
              //                 gradient: const LinearGradient(
              //                   colors: [
              //                     Color.fromRGBO(147, 81, 148, 1),
              //                     Color.fromRGBO(91, 168, 209, 1),
              //                   ],
              //                   stops: [0.06, 0.83],
              //                   begin: Alignment(1, 0),
              //                   end: Alignment(0, 1),
              //                 )),
              //             child: ListTile(
              //                 title: Text(
              //                   'City: ${weather.name}, ${weather.sys!.country}',
              //                   style: const TextStyle(
              //                       fontSize: 18,
              //                       fontWeight: FontWeight.w400,
              //                       color: Colors.white),
              //                 ),
              //                 subtitle: Text(
              //                   'Temperature: ${weather.main.temp}°C',
              //                   style: const TextStyle(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.w400),
              //                 ),
              //                 trailing: Image.asset(
              //                   // "assets/weather/${weather.weather[0].icon}.png",
              //                   weather.weather[0].path,
              //                   height: Get.height * .07,
              //                 ),
              //                 onTap: () {
              //                   // Navigator.push(
              //                   //   context,
              //                   //   MaterialPageRoute(
              //                   //     builder: (context) =>
              //                   //         WeatherDetailScreen(
              //                   //             weather: weather),
              //                   //   ),
              //                   // );
              //                   textEAD.clear();
              //                 }),
              //           );
              //         },
              //       );
              //     }
              //   }),
              // ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
