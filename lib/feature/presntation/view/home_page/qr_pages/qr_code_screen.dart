import 'dart:math';

import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/home_page/qr_pages/component/regenerate_botton.dart';
import 'package:attendance_app/feature/presntation/view/home_page/qr_pages/component/regenerate_container.dart';
import 'package:attendance_app/feature/presntation/view/home_page/qr_pages/component/regenerate_timer.dart';
import 'package:attendance_app/feature/presntation/view/home_page/qr_pages/component/timer_qr.dart';
import 'package:attendance_app/feature/presntation/view/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Directionality(
            textDirection:
                languageApp == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
            child: Scaffold(
              backgroundColor: AppColor.primary2Color,
              body: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            navigatorFinished(context, const MainLayout());
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        CircleAvatar(
                          radius: 30.r,
                          backgroundImage: NetworkImage(userData!.avatar!),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${userData!.name}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              name,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150.h,
                    ),
                    Text(
                      languageApp == 'Arabic'
                          ? AppStrings.qrCodeAr
                          : AppStrings.qrCodeEn,
                      style: TextStyle(color: Colors.white, fontSize: 16.spMin),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: QrImage(
                        data: cubit.generateRandomString(20),
                        backgroundColor: Colors.white,
                        size: 280.spMin,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    if (!cubit.isRegenerate) TimerQr(cubit: cubit),
                    if (isRegenerate) RegenerateTimer(cubit: cubit),
                    if (!isRegenerate && cubit.isRegenerate)
                      Text(
                        'this code will generate automatic in 00:00',
                        style: TextStyle(
                          fontSize: 16.spMin,
                          color: Colors.white,
                        ),
                      ),
                    SizedBox(height: 50.h),
                    if (!cubit.isRegenerate) const RegenerateContainer(),
                    if (cubit.isRegenerate) RegenerateButton(cubit: cubit),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
