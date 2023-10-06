import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/home_screen.dart';
import 'package:weather_app/view/offline_home_screen.dart';
import 'package:weather_app/view/online_home_screen.dart';
import 'package:weather_app/view/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
              getPages: [
                GetPage(name: "/home_screen", page:()=>const HomeScreen()),
                GetPage(name: "/offline_home_screen", page:()=>const OfflineHomeScreen()),
                GetPage(name: "/online_home_screen", page:()=>const OnlineHomeScreen()),
              ],
          );
        });
  }
}
