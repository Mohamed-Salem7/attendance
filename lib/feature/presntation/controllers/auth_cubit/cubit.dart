import 'package:attendance_app/feature/presntation/controllers/auth_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitAuthState());
  static AuthCubit get(context) => BlocProvider.of(context);


  bool isPasswordVisibility = false;

  void changeVisibilityPassword()
  {
    isPasswordVisibility = !isPasswordVisibility;
    emit(ChangeVisibilityPasswordState());
  }

  int index = 0;
  void changeSelectRegister(value)
  {
    index = value;
    emit(ChangeSelectRegisterState());
  }

}