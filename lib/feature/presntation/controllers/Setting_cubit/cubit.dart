import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/network/cache_helper.dart';
import 'package:attendance_app/feature/presntation/controllers/Setting_cubit/state.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/home_page/home_screen.dart';
import 'package:attendance_app/feature/presntation/view/notification_page/notification_screen.dart';
import 'package:attendance_app/feature/presntation/view/setting_page/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(InitSettingState());
  static SettingCubit get(context) => BlocProvider.of(context);


  int language = 0;
  Future<void> changeLanguage(value)
  async {
    language = value;

    if(language == 0)
    {
      languageApp = 'English';
    }else
    {
      languageApp = 'Arabic';
    }
    await CacheHelper.saveData(key: 'language', value: languageApp);
    emit(ChangeLanguageAppState());
  }

}