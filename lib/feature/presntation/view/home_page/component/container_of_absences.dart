import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerOfAbsences extends StatelessWidget {
  const ContainerOfAbsences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 360.w,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: BorderDirectional(
          start: BorderSide(
            color: AppColor.primaryColor,
            width: 5.w,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Row(
          children: [
            Text(
              languageApp == 'Arabic'? AppStrings.absencesAr: AppStrings.absencesEn,
              style: TextStyle(
                fontSize: 14.spMin,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            Text(
              '5',
              style: TextStyle(
                fontSize: 18.spMin,
                fontWeight: FontWeight.bold,
                color: AppColor.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
