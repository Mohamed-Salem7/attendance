import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegenerateContainer extends StatelessWidget {
  const RegenerateContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5.r,),
      ),
      child: Center(
        child: Text(
          'Regenerate Now',
          style: TextStyle(fontSize: 18.spMin,color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
