import 'package:attendance_app/core/network/dio_helper.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/state.dart';
import 'package:attendance_app/model/LoginModel.dart';
import 'package:attendance_app/model/RegisterModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitAuthState());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isPasswordVisibility = false;

  void changeVisibilityPassword() {
    isPasswordVisibility = !isPasswordVisibility;
    emit(ChangeVisibilityPasswordState());
  }

  int index = 0;

  void changeSelectRegister(value) {
    index = value;
    emit(ChangeSelectRegisterState());
  }

  String uId = '';
  Future<void> createAccount({
    required String email,
    required String name,
    required String mobile,
    required String type,
    required String password,
  }) async{
    emit(LoadingCreateNewUserState());
    await DioHelper.postData(
      url: '/user',
      data: {
        'type' : type,
        'name' : name,
        'mobile' : mobile,
        'email' : email,
        'password' : password,
        'password_confirmation' : password,
      },
    ).then((value) {
      uId = mobile;
      emit(SuccessCreateNewUserState());
    }).catchError((e){
      emit(ErrorCreateNewUserState());
    });
  }



  LoginModel? loginModel;
  Future<void> loginUser({
    required String mobile,
    required String password,
  }) async{
    emit(LoadingLoginUserState());
    await DioHelper.postData(
      url: '/auth/login',
      data: {
        'mobile' : mobile,
        'password' : password,
      },
    ).then((value) {
      uId = mobile;
      emit(SuccessLoginUserState());
    }).catchError((e){
      emit(ErrorLoginUserState());
    });
  }
}
