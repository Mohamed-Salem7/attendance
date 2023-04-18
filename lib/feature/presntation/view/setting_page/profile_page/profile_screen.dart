import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/view/login_screen/component/text_form_field.dart';
import 'package:attendance_app/feature/presntation/view/setting_page/profile_page/component/Image_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();

    return Directionality(
      textDirection: languageApp == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColor.primary2Color,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                languageApp == 'Arabic' ? AppStrings.updateProfileAr: AppStrings.updateProfileEn,
                style: TextStyle(
                  fontSize: 26.spMin,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const UpdateImageUser(),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                        hintText: languageApp == 'Arabic' ? AppStrings.nameAr: AppStrings.nameEn,
                        controller: nameController,
                        isPassword: false),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                        hintText: languageApp == 'Arabic' ? AppStrings.passwordAr :AppStrings.passwordEn,
                        controller: passwordController,
                        isPassword: true),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                        hintText: languageApp == 'Arabic' ? AppStrings.phoneAr:AppStrings.phoneEn ,
                        controller: phoneController,
                        isPassword: false),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColor.primaryColor, width: 1.3.w),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: InkWell(
                        onTap: (){},
                        borderRadius: BorderRadius.circular(10.r),
                        child: Center(
                          child: Text(
                            languageApp == 'Arabic' ? AppStrings.saveAr: AppStrings.saveEn,
                            style: TextStyle(
                              color: AppColor.secondaryColor,
                              fontSize: 18.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: Container(
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.primaryColor, width: 1.3.w),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: InkWell(
                        onTap: ()
                        {
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(10.r),
                        child: Center(
                          child: Text(
                            languageApp == 'Arabic' ? AppStrings.cancelAr: AppStrings.cancelEn,
                            style: TextStyle(
                              color: AppColor.secondaryColor,
                              fontSize: 18.spMin,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
