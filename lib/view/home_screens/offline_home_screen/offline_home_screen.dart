import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants.dart';

class OfflineHomeScreen extends StatelessWidget {
  const OfflineHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
      body: Stack(
        children: [
          Center(child: Image.asset('assets/images/noInternet.png')),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'OFFLINE !',
                  style: AppTextStyle().headlineWhite,
                ),
                SizedBox(height: 5.h),
                Text('Please check your internet \nconnection.',
                    style: AppTextStyle().subTitleBlue.copyWith(height: 1.3.sp),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}