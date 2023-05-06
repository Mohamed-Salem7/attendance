import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/network/cache_helper.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/login_screen/component/text_form_field.dart';
import 'package:attendance_app/feature/presntation/view/main_layout/main_layout.dart';
import 'package:attendance_app/feature/presntation/view/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stdNumberController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
      var cubit = AuthCubit.get(context);
      return Scaffold(
        backgroundColor: AppColor.primary2Color,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Attendance app',
                    style: TextStyle(
                      fontSize: 24.spMin,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Login with you student number and password to app.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.spMin,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomTextField(
                    hintText: 'Phone Number',
                    controller: stdNumberController,
                    isPassword: false,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    controller: passwordController,
                    isPassword: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'forget Password?',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200.w,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.loginUser(
                                mobile: stdNumberController.text,
                                password: passwordController.text,
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => AppColor.primaryColor)),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 18.spMin),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            RegisterScreen(),
                          );
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is SuccessLoginUserState) {
        CacheHelper.saveData(key: 'uId', value: AuthCubit.get(context).uId);
        navigatorFinished(context, const MainLayout());
      }
    });
  }
}
