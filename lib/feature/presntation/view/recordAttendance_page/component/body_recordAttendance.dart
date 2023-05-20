import 'package:attendance_app/core/utils/app_images/images_manager.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';

class BodyAttendanceRecord extends StatelessWidget {
  const BodyAttendanceRecord({Key? key, required this.courseId, required this.nameCourse, required this.function}) : super(key: key);

  final String courseId;
  final String nameCourse;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: AppColor.primary3Color,
            child: LineIcon.university(),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  nameCourse,
                  style: TextStyle(
                    fontSize: 18.spMin,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  courseId,
                  style: TextStyle(
                    fontSize: 14.spMin,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios,color: Colors.white,)
        ],
      ),
    );
  }
}
