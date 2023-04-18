import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/Setting_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/Setting_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit, SettingState>(
        builder: (context, state) {
          var cubit = SettingCubit.get(context);
          return Directionality(
            textDirection: languageApp == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
            child: Dialog(
              backgroundColor: AppColor.primary2Color,
              insetPadding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 180.h,
                width: 300.w,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.0.h,
                    left: 20.0.w,
                    right: 20.0.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languageApp == 'Arabic' ? 'اللغة': 'Language',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.spMin,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 0,
                              groupValue: languageApp == 'English' ? 0 : 1,
                              onChanged: (value) {
                                cubit.changeLanguage(value);
                              }),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            languageApp == 'Arabic' ? "إنجليزي" : 'English',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.spMin),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: languageApp == 'Arabic' ? 1 : 0,
                              onChanged: (value) {
                                cubit.changeLanguage(value);
                              }),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            languageApp == 'Arabic' ? "عربي" : 'Arabic',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 18.spMin,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
