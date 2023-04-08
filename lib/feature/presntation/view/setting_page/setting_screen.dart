import 'package:attendance_app/core/utils/app_images/images_manager.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/view/setting_page/component/coustem_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Settigns',
              style: TextStyle(
                fontSize: 26.spMin,
                fontWeight: FontWeight.w500,

                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20.h,),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:  const AssetImage(AppImage.user),
                    radius: 35.r,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'Mohamed M Salem',
                    style: TextStyle(
                      fontSize: 18.spMin,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTile(
              title: 'Notification',
              icon: Icons.notifications_none_outlined,
              isLanguage: false,
            ),

            SizedBox(
              height: 20.h,
            ),
            CustomTile(
              title: 'About',
              icon: Icons.info_outlined,
              isLanguage: false,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTile(
              title: 'Language',
              isLanguage: true,
              icon: Icons.language_outlined,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTile(
              title: 'Logout',
              icon: Icons.exit_to_app_sharp,
              isLanguage: false,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
