import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';


class MainLayout extends StatelessWidget {

  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<MainCubit, MainState>(
      builder: (context, state) {

        var cubit = MainCubit.get(context);

        return Directionality(
          textDirection: languageApp == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: AppColor.primary2Color,
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: FloatingNavbar(
              currentIndex: cubit.currentIndex,
              backgroundColor: AppColor.primary2Color,
              itemBorderRadius: 20.r,
              borderRadius: 20.r,
              margin:  EdgeInsets.only(bottom: 5.h,left: 8.w,right: 8.w),
              onTap: (value) {
                cubit.changeIndex(value);
              },
              items: [
                FloatingNavbarItem(
                    icon: LineIcon.home().icon,
                    title: languageApp != 'Arabic' ? 'Home' : "الرئيسية"
                ),
                FloatingNavbarItem(
                    icon: LineIcon.file().icon,
                    title: languageApp != 'Arabic' ? 'Attendance Record' : "سجل الحضور",
                ),
                FloatingNavbarItem(
                    icon: Icons.settings_outlined,
                  title: languageApp != 'Arabic' ? 'Setting' : "الإعدادات"
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
