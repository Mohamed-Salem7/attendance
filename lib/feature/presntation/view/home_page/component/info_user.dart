import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoUser extends StatefulWidget {
  const InfoUser({Key? key}) : super(key: key);

  @override
  State<InfoUser> createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  @override
  Widget build(BuildContext context) {
    return Container  (
      height: languageApp == 'Arabic'? 120.h : 95.h,
      width: 360.w,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColor.primary3Color.withOpacity(0.2),
        border: BorderDirectional(
          start: BorderSide(
            color: AppColor.primaryColor,
            width: 5.w,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            languageApp == 'Arabic'? "مرحبا,${userData!.name}":'Welcome, ${userData!.name}',
            style: TextStyle(
              fontSize: 14.spMin,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            languageApp == 'Arabic'? AppStrings.whenLastTimeAr: AppStrings.whenLastTimeEn,
            style: TextStyle(
              fontSize: 14.spMin,
              fontWeight: FontWeight.w300,
              color: AppColor.secondaryColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          BlocConsumer<MainCubit,MainState>(
            listener: (context,state){},
            builder: (context,state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    languageApp == 'Arabic'? "اليوم عند ${MainCubit.get(context).time}": 'Today at ${MainCubit.get(context).time}',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 18.spMin,
                      fontWeight: FontWeight.w500,
                      color: AppColor.secondaryColor,
                    ),
                  ),
                ],
              );

            }
          ),
        ],
      ),
    );
  }
}
