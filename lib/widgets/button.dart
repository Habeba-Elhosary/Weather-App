import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/text_constants.dart';
import '../constants/color_constants.dart';

class MyButton extends StatelessWidget {
  final String title;
  final String page ;

  const MyButton({required this.title, required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(page);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric( horizontal: 15.sp,vertical:10.sp),
        decoration: BoxDecoration(
          color: MyColors.grey,
          border: Border.all(
              color: MyColors.lightGrey, width: 2.w, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Text(title , style: AppTextStyle().headlineWhite.copyWith(fontSize: 14.sp)),
            const Spacer(),
            Icon(Icons.arrow_forward_ios_outlined,color: MyColors.blue,size: 15.sp,),
          ],
        ),
      ),
    );
  }
}
