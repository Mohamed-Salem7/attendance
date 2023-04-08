import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoUser extends StatelessWidget {
  const InfoUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container  (
      height: 95.h,
      width: 360.w,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border(
          left: BorderSide(
            color: AppColor.primaryColor,
            width: 5.w,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, Mohamed M Salem',
            style: TextStyle(
              fontSize: 14.spMin,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'When was the last time you attended the class',
            style: TextStyle(
              fontSize: 14.spMin,
              fontWeight: FontWeight.w300,
              color: AppColor.secondaryColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'at 02:07 PM Today',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
