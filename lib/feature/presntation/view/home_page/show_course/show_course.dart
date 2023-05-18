import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/view/home_page/show_course/compnent/courser.dart';
import 'package:attendance_app/feature/presntation/view/setting_page/component/coustem_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowCourse extends StatelessWidget {
  const ShowCourse({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Text(
                    languageApp == 'Arabic' ? "عرض المساقات" : "Show Courses",
                    style: TextStyle(
                      fontSize: 26.spMin,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              ListView.separated(
                itemCount: listCourseStudentModel.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if(listCourseStudentModel[index].member!.contains(userData!.email)) {
                    return const SizedBox();
                  }else {
                    return Course(
                      name: listCourseStudentModel[index].name!,
                      courseId: listCourseStudentModel[index].courseId!,
                      drName: listCourseStudentModel[index].drName!,
                      members: listCourseStudentModel[index].member!,
                    );
                  }
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
