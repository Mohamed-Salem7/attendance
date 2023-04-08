import 'package:attendance_app/core/utils/app_images/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashText extends StatelessWidget {
  const SplashText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Attendance',
        style: TextStyle(
          fontSize: 28.spMin,
        ),
      ),
    );
  }
}