import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/constants/routes_constants.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_constants.dart';
import '../../controller/global_controller.dart';

class SearchScreen extends GetView<GlobalController> {
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
              SizedBox(height: 30.h),
              TextField(
                onTapOutside: (event){FocusManager.instance.primaryFocus?.unfocus();},
                controller: textController,
                style: AppTextStyle().subTitleBlue.copyWith(
                    fontSize: 15.sp,
                    color: MyColors.white,
                    fontWeight: FontWeight.w400),
                onSubmitted: (value) {
                  if (value.isEmpty) {
                    Text('Please enter a city name',style: AppTextStyle().headlineBlue,);
                  } else {
                    controller.fetchSearchData(value);
                      Get.toNamed(searchDetailsScreen);
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined,
                      size: 25.sp, color: MyColors.blue),
                  filled: true,
                  fillColor: MyColors.grey,
                  labelText: "Enter the city name ",
                  labelStyle: AppTextStyle().subTitleBlue.copyWith(fontSize: 15.sp),
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
              SizedBox(height: 70.h),
              Image.asset("assets/images/search.png"),
            ],
          ),
        ),
      ),
    );
  }
}
