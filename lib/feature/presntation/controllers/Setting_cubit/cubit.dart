import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/network/cache_helper.dart';
import 'package:attendance_app/feature/presntation/controllers/Setting_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(InitSettingState());

  static SettingCubit get(context) => BlocProvider.of(context);

  int language = 0;

  Future<void> changeLanguage(value) async {
    language = value;

    if (language == 0) {
      languageApp = 'English';
    } else {
      languageApp = 'Arabic';
    }
    await CacheHelper.saveData(key: 'language', value: languageApp);
    emit(ChangeLanguageAppState());
  }

  Future<void> signOut(context) async {
    emit(LoadingSignOutAppState());
    await FirebaseAuth.instance.signOut().then((value) {
      CacheHelper.saveData(key: 'uId', value: '');
      uIds = '';
      navigatorFinished(context, const LoginScreen());
      emit(SuccessSignOutAppState());
    }).catchError((error){
      emit(ErrorSignOutAppState());
    });
  }
}
