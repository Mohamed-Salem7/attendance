import 'dart:async';

import 'package:attendance_app/feature/presntation/view/login_screen/login_screen.dart';
import 'package:attendance_app/feature/presntation/view/main_layout/main_layout.dart';
import 'package:attendance_app/feature/presntation/view/on_boarding/on_boarding.dart';
import 'package:attendance_app/feature/presntation/view/splash_screen/component/splash_icon.dart';
import 'package:attendance_app/feature/presntation/view/splash_screen/component/splash_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 1), _goNext);
  }

  _goNext() {
    Get.to(const OnBoarding(),transition: Transition.cupertinoDialog);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children:  [
          SizedBox(height: 50.h,),
          const SplashIcon(),
          const SplashText(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
