import 'package:attendance_app/core/utils/app_images/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateImageUser extends StatelessWidget {
  const UpdateImageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 65.r,
              backgroundImage: const AssetImage(AppImage.user),
            ),
            PositionedDirectional(
              top: 90.h,
              start: 90.w,
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.edit),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
