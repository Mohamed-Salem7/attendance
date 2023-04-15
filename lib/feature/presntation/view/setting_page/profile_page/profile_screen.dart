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

    return Scaffold(
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
              'Update Profile',
              style: TextStyle(
                fontSize: 26.spMin,
                fontWeight: FontWeight.w500,
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
                      hintText: 'Name',
                      controller: nameController,
                      isPassword: false),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                      hintText: 'Password',
                      controller: passwordController,
                      isPassword: true),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                      hintText: 'Phone Number',
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
                          'Save',
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
                          'Cancel',
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
    );
  }
}
