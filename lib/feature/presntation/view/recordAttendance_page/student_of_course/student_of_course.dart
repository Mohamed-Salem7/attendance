import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/recordAttendance_page/attendanceForCourse_page/attendanceForCourse.dart';
import 'package:attendance_app/feature/presntation/view/recordAttendance_page/component/body_recordAttendance.dart';
import 'package:attendance_app/feature/presntation/view/recordAttendance_page/student_of_course/component/body_student_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StudentOfCourse extends StatelessWidget {
  const StudentOfCourse({Key? key, required this.courseId}) : super(key: key);

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainState>(
      listener: (context,state){},
      builder:(context,state) {
        MainCubit.get(context).getStudentsCourse(courseId: courseId);
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
                    languageApp == 'Arabic' ? "طلاب المساق" : 'Students in Course',
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
                      itemBuilder: (context, index) =>
                          BodyStudentCourse(
                            avatar: listStudentsCourse[index].avatar!,
                            nameStudent: listStudentsCourse[index].name!,
                            function: () {
                              Get.to(AttendanceForCourse(courseId : courseId,uId: listStudentsCourse[index].uId!,isTeacher: true,));
                            },
                          ),
                      separatorBuilder: (context, index) =>
                          SizedBox(
                            height: 15.h,
                          ),
                      itemCount: listStudentsCourse.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
