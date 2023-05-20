import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/recordAttendance_page/attendanceForCourse_page/compnent/body_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AttendanceForCourse extends StatelessWidget {
  const AttendanceForCourse({Key? key, required this.courseId})
      : super(key: key);

  final String courseId;

  @override
  Widget build(BuildContext context) {
    MainCubit.get(context).getAttendanceStudent(courseId: courseId);
    return Directionality(
      textDirection: languageApp == 'Arabic' ? textDirection[0] : textDirection[1],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
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
                  languageApp == 'Arabic' ? "السجل" : 'Record',
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
                BodyRecord(
                  course: 'Att',
                  date: 'Date',
                  day: 'Day',
                  courseAr: "حضور",
                  dateAr: "التاريخ",
                  dayAr: 'اليوم',
                  isRecord: false,
                ),
                 const Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: listAttendanceModel.length,
                  itemBuilder: (context, index) {
                    DateTime times = DateTime.parse(listAttendanceModel[index].time!);
                    String day = DateFormat('EEEE').format(times);
                    String date = DateFormat.Md().format(times);
                    return BodyRecord(
                        course: listAttendanceModel[index].data! != null ? "S" : "F",
                        isRecord: true,
                        date: date,
                        day: day);
                  },
                  separatorBuilder: (context,index) => SizedBox(height: 10.h,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
