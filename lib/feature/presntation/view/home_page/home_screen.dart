import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/App_string/language_string.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/view/home_page/component/class_container.dart';
import 'package:attendance_app/feature/presntation/view/home_page/component/container_of_absences.dart';
import 'package:attendance_app/feature/presntation/view/home_page/component/info_user.dart';
import 'package:attendance_app/feature/presntation/view/home_page/qr_pages/qr_code_screen.dart';
import 'package:attendance_app/feature/presntation/view/home_page/scan_qr/scan_qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      'Software Engineering',
      'Networks',
      'Embedded Systems',
      'VHDL'
    ];
    List<String> name = [
      'Hatem Hmmad',
      'Aiman AbuSamra',
      'Ibrahim Abu Hieba',
      'Ahmed Mahdi'
    ];
    List<String> attendances = ['50', '20', '1', '24'];


    return Directionality(
      textDirection: languageApp == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColor.primary2Color,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Text(
                    languageApp == 'Arabic'? AppStrings.homeScreenAr : AppStrings.homeScreenEn,
                    style: TextStyle(
                      fontSize: 26.spMin,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.post_add,color: Colors.white,size: 30.spMin,),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.person,color: Colors.white,size: 30.spMin,),),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const InfoUser(),
              SizedBox(
                height: 10.h,
              ),
              const ContainerOfAbsences(),
              SizedBox(
                height: 20.h,
              ),
              Text(
                languageApp == 'Arabic'? AppStrings.classesJoinedAr : AppStrings.classesJoinedEn,
                style: TextStyle(
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 1,
                  ),
                  itemCount: 4,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ClassContainer(
                      title: title[index],
                      name: name[index],
                      attendances: attendances[index],
                      function: () {
                        Get.to(const ScanQr(),transition: Transition.fadeIn);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
