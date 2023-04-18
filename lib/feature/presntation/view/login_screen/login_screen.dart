import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/view/login_screen/component/text_form_field.dart';
import 'package:attendance_app/feature/presntation/view/main_layout/main_layout.dart';
import 'package:attendance_app/feature/presntation/view/register_screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stdNumberController = TextEditingController();
    var passwordController = TextEditingController();
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
                      fontSize: 24.spMin, fontWeight: FontWeight.bold,color: Colors.white,),
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
                  hintText: 'Email',
                  controller: stdNumberController,
                  isPassword: false,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  isPassword: true,
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
                        onPressed: ()
                        {
                          navigatorFinished(context, const MainLayout());
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => AppColor.primaryColor)
                        ),
                        child:  Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 18.spMin
                          ),
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
                    const Text('Don\'t have an account?',style: TextStyle(color: Colors.white,),),
                    TextButton(
                      onPressed: () {
                        Get.to(RegisterScreen(),transition: Transition.leftToRight);
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
  }
}
