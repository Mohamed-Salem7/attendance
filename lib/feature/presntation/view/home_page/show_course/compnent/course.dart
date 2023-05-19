import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Course extends StatelessWidget {
  const Course(
      {Key? key,
      required this.name,
      required this.courseId,
      required this.drName,
      required this.members})
      : super(key: key);

  final String name;
  final String courseId;
  final String drName;
  final List<String> members;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Row(
            children: [
              const Icon(Icons.arrow_forward_ios, color: AppColor.primaryColor),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20.spMin,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  MainCubit.get(context).joinToCourse(
                    courseId: courseId,
                    name: name,
                    drName: drName,
                    members: members,
                    nameStudent: userData!.name!,
                    avatarStudent: userData!.avatar!,
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => AppColor.primaryColor),
                ),
                child: Text(
                  languageApp == 'Arabic' ? "إنضمام الأن" : "Join Now",
                  style: TextStyle(
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        });
  }
}
