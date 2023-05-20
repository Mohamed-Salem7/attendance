import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/view/recordAttendance_page/attendanceForCourse_page/attendanceForCourse.dart';
import 'package:attendance_app/feature/presntation/view/recordAttendance_page/component/body_recordAttendance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecordAttendanceScreen extends StatelessWidget {
  const RecordAttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          languageApp == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColor.primary2Color,
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
                languageApp == 'Arabic'
                    ? AppStrings.notificationScreenAr
                    : AppStrings.notificationScreenEn,
                style: TextStyle(
                  fontSize: 26.spMin,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => BodyAttendanceRecord(
                    courseId: studentCourseModel[index].courseId!,
                    nameCourse: studentCourseModel[index].name!,
                    function: ()
                    {
                      Get.to(AttendanceForCourse(courseId: studentCourseModel[index].courseId!,));
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 15.h,
                  ),
                  itemCount: studentCourseModel.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
