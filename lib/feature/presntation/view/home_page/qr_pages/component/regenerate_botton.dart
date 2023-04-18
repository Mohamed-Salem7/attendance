import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegenerateButton extends StatelessWidget {
  RegenerateButton({Key? key, required this.cubit}) : super(key: key);

  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200.w,
          height: 50.h,
          child: ElevatedButton(
            onPressed: () {
              isRegenerate = true;
              cubit.isSelect = true;
              cubit.generateRandomString(20);
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateColor.resolveWith(
                        (states) => AppColor.primaryColor)),
            child: Text(
              'Regenerate Now',
              style: TextStyle(fontSize: 18.spMin),
            ),
          ),
        ),
      ],
    );
  }
}
