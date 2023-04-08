import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/home_page/home_screen.dart';
import 'package:attendance_app/feature/presntation/view/notification_page/notification_screen.dart';
import 'package:attendance_app/feature/presntation/view/setting_page/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitMainState());
  static MainCubit get(context) => BlocProvider.of(context);




  int currentIndex = 0;

  void changeIndex(index)
  {
    currentIndex = index;
    emit(ChangeIndexScreenState());
  }


  List<Widget> screen =
  [
    const HomeScreen(),
    const NotificationScreen(),
    const SettingScreen(),
  ];

}