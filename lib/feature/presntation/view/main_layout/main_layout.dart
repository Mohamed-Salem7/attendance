import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: DotNavigationBar(
            currentIndex: cubit.currentIndex,
            backgroundColor: Colors.black,
            borderRadius: 30.r,
            onTap: (value) {
              cubit.changeIndex(value);
            },
            items: [
              /// Home
              DotNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  selectedColor: AppColor.primaryColor,
                  unselectedColor: Colors.grey,
              ),
              /// Records
              DotNavigationBarItem(
                  icon: Icon(Icons.notifications_none_outlined),
                  selectedColor: AppColor.primaryColor,
                  unselectedColor: Colors.grey,
              ),
              /// Profile
              DotNavigationBarItem(
                  icon: Icon(Icons.person),
                  selectedColor: AppColor.primaryColor,
                  unselectedColor: Colors.grey),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
