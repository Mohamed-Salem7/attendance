import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.isPassword})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return TextFormField(
            controller: controller,
            style: TextStyle(
              fontSize: 18.spMin,
              color: AppColor.primaryColor,
            ),
            cursorColor: AppColor.primaryColor,
            onTap: (){},
            obscureText: isPassword ?  cubit.isPasswordVisibility : false,
            decoration: InputDecoration(
                fillColor: Colors.grey.shade900,
                prefixIcon: isPassword ? const Icon(Icons.lock_outline) : null,
                suffixIcon: isPassword
                    ? cubit.isPasswordVisibility
                        ? IconButton(
                            onPressed: ()
                            {
                              cubit.changeVisibilityPassword();
                            },
                            icon: const Icon(
                              Icons.visibility,
                            ),
                          )
                        : IconButton(
                            onPressed: ()
                            {
                              cubit.changeVisibilityPassword();
                            },
                            icon: const Icon(
                              Icons.visibility_off,
                            ),
                          )
                    : null,
                prefixIconColor: AppColor.primaryColor,
                suffixIconColor: AppColor.primaryColor,
                filled: true,
                focusColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide:  BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: const BorderSide(
                    color: AppColor.primaryColor,
                    width: 1.5,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 16.spMin,
                  color: AppColor.primaryColor,
                )),
          );
        },
        listener: (context, state) {});
  }
}
