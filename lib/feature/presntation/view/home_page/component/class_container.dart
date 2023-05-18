import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassContainer extends StatelessWidget {
  const ClassContainer(
      {Key? key,
      required this.title,
      required this.name,
      required this.function, required this.courseId})
      : super(key: key);

  final String title;
  final String name;
  final String courseId;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
       borderRadius: BorderRadius.circular(15.r),
      onTap: function,
      child: Container(
        height: 60.h,
        width: 140.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.r,
          ),
          color: AppColor.primary3Color.withOpacity(0.2),
          border: Border.all(color: AppColor.primaryColor, width: 1.5.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                languageApp == 'Arabic'? "دكتور: $name":'Dr: $name',
                style: TextStyle(
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                courseId,
                style: TextStyle(
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
