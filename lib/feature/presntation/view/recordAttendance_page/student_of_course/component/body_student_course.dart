import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/app_images/images_manager.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';

class BodyStudentCourse extends StatelessWidget {
  const BodyStudentCourse({Key? key, required this.nameStudent, required this.function, required this.avatar}) : super(key: key);

  final String nameStudent;
  final String avatar;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: NetworkImage(avatar),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nameStudent,
                style: TextStyle(
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),

            ],
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios,color: Colors.white,)
        ],
      ),
    );
  }
}
