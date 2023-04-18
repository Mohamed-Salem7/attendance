import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/app_images/images_manager.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/view/register_screen/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingSlider(
          headerBackgroundColor: AppColor.primary2Color,
          finishButtonText: 'Register',
          pageBackgroundColor: AppColor.primary2Color,
          controllerColor: AppColor.primaryColor,
          finishButtonStyle: const FinishButtonStyle(
            backgroundColor:AppColor.primaryColor,
          ),
          onFinish: ()
          {
            navigatorFinished(context, const RegisterScreen());
          },
          skipTextButton: const Text(
            'Skip',
            style: TextStyle(color:AppColor.primaryColor),
          ),
          trailing: const Text(
            'Register',
            style: TextStyle(
              color: AppColor.primaryColor,

            ),
          ),
          trailingFunction: ()
          {
            navigatorFinished(context, const RegisterScreen());
          },
          skipFunctionOverride: ()
          {
            navigatorFinished(context, const RegisterScreen());
          },
          background: [
            Image.asset(AppImage.qr2Img,
                height: 450.h, width: 360.w,),
            Image.asset(
              AppImage.qr1Img,
              height: 450.h,
              width: 360.w,
            ),
            Image.asset(
              AppImage.qr3Img,
              height: 450.h,
              width: 360.w,
            ),
          ],
          totalPage: 3,
          speed: 1.8,
          pageBodies: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 480.h,
                  ),
                  Text(
                    'The Qr Code is generate at student to scan',
                    style: TextStyle(
                      fontSize: 18.spMin,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 480.h,
                  ),
                  Text(
                    'Scanning the qr code at teacher',
                    style: TextStyle(
                      fontSize: 18.spMin,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 480.h,
                  ),
                  Text(
                    'Checking the result of the QR code, whether it matches or not',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.spMin,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
