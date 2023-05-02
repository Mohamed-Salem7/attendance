import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/app_images/images_manager.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/Setting_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/Setting_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/setting_page/Dialog_language/dialog_language.dart';
import 'package:attendance_app/feature/presntation/view/setting_page/about_page/about_screen.dart';
import 'package:attendance_app/feature/presntation/view/setting_page/component/coustem_tile.dart';
import 'package:attendance_app/feature/presntation/view/setting_page/profile_page/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingCubit,SettingState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Directionality(
            textDirection: languageApp == 'Arabic'
                ? TextDirection.rtl
                : TextDirection.ltr,
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
                      languageApp == 'Arabic'? AppStrings.settingScreenAr: AppStrings.settingScreenEn,
                      style: TextStyle(
                        fontSize: 26.spMin,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    InkWell(
                      onTap: () {
                        Get.to(const ProfileScreen());
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: const AssetImage(AppImage.user),
                            radius: 35.r,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            languageApp == 'Arabic'? AppStrings.profileAr: AppStrings.profileEn,
                            style: TextStyle(
                              fontSize: 18.spMin,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTile(
                      title: languageApp == 'Arabic'? AppStrings.languageAr : AppStrings.languageEn,
                      isLanguage: true,
                      icon: Icons.language_outlined,
                      function: () {
                        return showDialog(
                            context: context,
                            builder: (context) => const LanguageDialog()).then((value) {
                              SettingCubit.get(context).emit(ChangeLanguageAppState());
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTile(
                      title: languageApp == 'Arabic'? AppStrings.aboutAr:AppStrings.aboutEn,
                      icon: Icons.info_outlined,
                      isLanguage: false,
                      function: ()
                      {
                        Get.to(AboutScreen());
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTile(
                      title: languageApp == 'Arabic'? AppStrings.logoutAr: AppStrings.logoutEn,
                      icon: LineIcon.alternateSignOut().icon!,
                      isLanguage: false,
                      color: Colors.red,
                      function: ()
                      {

                      },
                    ),
                  ],
                ),
              ),
            ),
          );

        }
    );
  }
}
