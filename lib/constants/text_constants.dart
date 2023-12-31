import 'package:flutter/material.dart';
import 'color_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  TextStyle headlineWhite= TextStyle(
    color: MyColors.white,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 30.sp,
  );

  TextStyle subTitleWhite1= TextStyle(
    color: MyColors.white,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 20.sp,
  );

  TextStyle headlineBlue = TextStyle(
    color: MyColors.blue,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 30.sp,
  );

  TextStyle subTitleBlue= TextStyle(
    color: MyColors.blue,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 15.sp,
  );
}