import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassContainer extends StatelessWidget {
  const ClassContainer(
      {Key? key,
      required this.title,
      required this.name,
      required this.attendances, required this.function})
      : super(key: key);

  final String title;
  final String name;
  final String attendances;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
       borderRadius: BorderRadius.circular(15.r),
      focusColor: Colors.red,
      onTap: function,
      child: Container(
        height: 60.h,
        width: 140.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15.r,
          ),
          color: Colors.grey.shade100,
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
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Dr: $name',
                style: TextStyle(
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Attendances: $attendances',
                style: TextStyle(
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
