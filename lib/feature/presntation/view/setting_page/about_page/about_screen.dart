import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          languageApp == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColor.primary2Color,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: SizedBox(
            width: 360.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  languageApp == 'Arabic'
                      ? AppStrings.aboutAr
                      : AppStrings.aboutEn,
                  style: TextStyle(
                    fontSize: 26.spMin,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  height: 350.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                    color: AppColor.primary3Color.withOpacity(0.2),
                    border: Border.all(
                        color: AppColor.primaryColor, width: 1.5.spMin),
                    borderRadius: BorderRadius.circular(
                      20.r,
                    ),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                        '"The quick brown fox jumps over the lazy dog" is a sentence that is commonly used in typing and typesetting as it contains every letter of the English alphabet. It is often used as a test of a keyboard or font, and has been used in popular culture, such as in movies and literature. The sentence is believed to have originated in the late 1800s and has since become a well-known phrase.',
                        textAlign: TextAlign.start,
                      maxLines: 15,
                      style: TextStyle(
                        height: 0.h,
                        fontSize: 18.spMin,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                        letterSpacing: 1.spMin,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
