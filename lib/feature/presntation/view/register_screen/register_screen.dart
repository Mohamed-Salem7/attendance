import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/login_screen/component/text_form_field.dart';
import 'package:attendance_app/feature/presntation/view/login_screen/login_screen.dart';
import 'package:attendance_app/feature/presntation/view/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stdNumberController = TextEditingController();
    var nameController = TextEditingController();
    var phoneNumberController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
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
                        'Register Now',
                        style: TextStyle(
                            fontSize: 24.spMin, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Please enter you information to register.',
                        style: TextStyle(
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
                        hintText: 'Name',
                        controller: nameController,
                        isPassword: false,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        hintText: 'Phone Number',
                        controller: phoneNumberController,
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
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Radio(
                              value: 0,
                              groupValue: cubit.index,
                              onChanged: (value)
                              {
                                cubit.changeSelectRegister(value);
                              },
                              fillColor: MaterialStateProperty.resolveWith(
                                (states) => AppColor.primaryColor,
                              )),
                          const Text('Student'),
                          Radio(
                              value: 1,
                              groupValue: cubit.index,
                              onChanged: (value)
                              {
                                cubit.changeSelectRegister(value);
                              },
                              fillColor: MaterialStateProperty.resolveWith(
                                (states) => AppColor.primaryColor,
                              )),
                          const Text('Teacher'),
                          Radio(
                              value: 2,
                              groupValue: cubit.index,
                              onChanged: (value)
                              {
                                cubit.changeSelectRegister(value);
                              },
                              fillColor: MaterialStateProperty.resolveWith(
                                (states) => AppColor.primaryColor,
                              )),
                          const Text('Guardian'),
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
                                navigatorFinished(context, const MainLayout());
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => AppColor.primaryColor)),
                              child: Text(
                                'Register Now',
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
                          const Text('Already you have an account?'),
                          TextButton(
                            onPressed: () {
                              navigatorFinished(context, const LoginScreen());
                            },
                            child: const Text(
                              'Login',
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
        },
        listener: (context, state) {});
  }
}
