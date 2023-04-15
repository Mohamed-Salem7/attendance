import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTile extends StatelessWidget {
  CustomTile(
      {Key? key,
      required this.title,
      required this.icon,
      this.color = AppColor.primaryColor,
        this.function,
      required this.isLanguage})
      : super(key: key);

  final String title;
  Color color;
  final IconData icon;
  final bool isLanguage;

  Function()? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SizedBox(
        height: 50.h,
        child: Row(
          children: [
            Icon(
              icon,
              size: 40.spMin,
              color: color,
            ),
            SizedBox(
              width: 15.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: languageApp == 'Arabic'? 16.spMin:18.spMin,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                if (isLanguage)
                  Text(
                    languageApp == 'Arabic'?  'العربية': 'English',
                    style: TextStyle(
                      fontSize: 14.spMin,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
