import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/login_screen/component/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCourse extends StatelessWidget {
  const AddCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameCourseController = TextEditingController();
    var lectureFromTimingController = TextEditingController();
    var lectureToTimingController = TextEditingController();
    var lectureDateController = TextEditingController();
    var courseIdController = TextEditingController();
    return BlocConsumer<MainCubit, MainState>(
        builder: (context, state) {
          return Directionality(
            textDirection:
                languageApp == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              backgroundColor: AppColor.primary2Color,
              body: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        languageApp == 'Arabic'
                            ? AppStrings.addCourseAr
                            : AppStrings.addCourseEn,
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
                      Text(
                        languageApp == 'Arabic' ? "إسم الكورس" : "Course Name",
                        style: TextStyle(
                          fontSize: 20.spMin,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        hintText: languageApp == 'Arabic'
                            ? "إسم الكورس"
                            : "Course Name",
                        controller: nameCourseController,
                        isPassword: false,
                        function: () {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        languageApp == 'Arabic'
                            ? "موعد المحاضرة"
                            : "Lecture Date",
                        style: TextStyle(
                          fontSize: 20.spMin,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        hintText: languageApp == 'Arabic'
                            ? "مثال(سبت,اثنين,اربعاء),موعد المحاضرة"
                            : "Lecture Date,e(Saturday,Monday,Wednesday)",
                        controller: lectureDateController,
                        isPassword: false,
                        function: () {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        languageApp == 'Arabic' ? "رقم المساق" : "Course Id",
                        style: TextStyle(
                          fontSize: 20.spMin,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        hintText:
                            languageApp == 'Arabic' ? "رقم المساق" : "Course Id",
                        controller: courseIdController,
                        isPassword: false,
                        function: () {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        languageApp == 'Arabic'
                            ? "توقيت المحاضرة"
                            : "Lecture timing",
                        style: TextStyle(
                          fontSize: 20.spMin,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            languageApp == 'Arabic' ? "من" : "from",
                            style: TextStyle(
                              fontSize: 14.spMin,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          SizedBox(
                            width: 130.w,
                            //height: 50.h,
                            child: CustomTextField(
                              hintText: languageApp == 'Arabic' ? "من" : "from",
                              controller: lectureFromTimingController,
                              keyboardType: TextInputType.datetime,
                              isPassword: false,
                              function: () {},
                            ),
                          ),
                          Text(
                            languageApp == 'Arabic' ? "إلى" : "to",
                            style: TextStyle(
                              fontSize: 14.spMin,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          SizedBox(
                            width: 130.w,
                            //height: 50.h,
                            child: CustomTextField(
                              hintText: languageApp == 'Arabic' ? "إلى" : "to",
                              controller: lectureToTimingController,
                              keyboardType: TextInputType.datetime,
                              isPassword: false,
                              function: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 180.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.primaryColor, width: 1.3.w),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: InkWell(
                                onTap: () {
                                  MainCubit.get(context).createSectionCourse(
                                      name: nameCourseController.text,
                                      lectureDate: lectureDateController.text,
                                      timingFromLecture:
                                          lectureFromTimingController.text,
                                      timingToLecture:
                                          lectureToTimingController.text,
                                      courseId: courseIdController.text);
                                },
                                borderRadius: BorderRadius.circular(10.r),
                                child: Center(
                                  child: Text(
                                    languageApp == 'Arabic'
                                        ? AppStrings.saveAr
                                        : AppStrings.saveEn,
                                    style: TextStyle(
                                      color: AppColor.secondaryColor,
                                      fontSize: 18.spMin,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.primaryColor, width: 1.3.w),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                borderRadius: BorderRadius.circular(10.r),
                                child: Center(
                                  child: Text(
                                    languageApp == 'Arabic'
                                        ? AppStrings.cancelAr
                                        : AppStrings.cancelEn,
                                    style: TextStyle(
                                      color: AppColor.secondaryColor,
                                      fontSize: 18.spMin,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if(state is SuccessAddNewSectionCourseState) {
            Navigator.pop(context);
          }
        });
  }
}
