import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/color_constants.dart';

class OnlineHomeScreen extends StatefulWidget {
  const OnlineHomeScreen({super.key});

  @override
  State<OnlineHomeScreen> createState() => _OnlineHomeScreenState();
}

class _OnlineHomeScreenState extends State<OnlineHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black ,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.sp, vertical: 90.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("Mansoura",
                      style: TextStyle(color: MyColors.white)),
                  SizedBox(
                    width: 100.w,
                  ),
                  Container(
                    color: MyColors.grey,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const Text("October 10 , 2023 ",
                  style: TextStyle(color: MyColors.white))
            ],
          ),
        ),
      ),
    );
  }
}
