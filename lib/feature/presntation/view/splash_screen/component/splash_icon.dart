import 'package:attendance_app/core/utils/app_images/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashIcon extends StatelessWidget {
  const SplashIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image(
        image: const AssetImage(
          AppImage.splashLightImg,
        ),
        width: 200.w,
      ),
    );
  }
}