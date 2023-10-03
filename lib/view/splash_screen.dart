import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/constants/color_constants.dart';
import '../constants/text_constants.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds:5),
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Opacity(
                  opacity: _animationController.value,
                  child: AnimatedSplashScreen(
                    duration: 1500,
                    splashIconSize: 200.sp,
                    splashTransition: SplashTransition.fadeTransition,
                    pageTransitionType: PageTransitionType.fade,
                    animationDuration: const Duration(milliseconds: 1500),
                    splash: Column(
                      children: [
                        const Image(
                          image: AssetImage("assets/images/logo.png"),
                        ),
                        SizedBox(height: 30.h),
                        Text('Weather App',
                            style: AppTextStyle().textBlueButton)
                      ],
                    ),
                    nextScreen: const HomeScreen(),
                  ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController
        .dispose();
    super.dispose();
  }
}
