import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/global_controller.dart';
import '../constants/color_constants.dart';
import '../widgets/header_widget.dart';

class OnlineHomeScreen extends StatefulWidget {
  const OnlineHomeScreen({Key? key}) : super(key: key);

  @override
  State<OnlineHomeScreen> createState() => _OnlineHomeScreenState();
}

class _OnlineHomeScreenState extends State<OnlineHomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    super.initState();
    globalController.checkLocationStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black,
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.blue,
                  ),
                )
              : ListView(
            scrollDirection: Axis.vertical,
            children: const [
              HeaderWidget(),
            ],
          )
        ),
      ),
    );
  }
}
