import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegenerateTimer extends StatelessWidget {
  const RegenerateTimer({Key? key, required this.cubit}) : super(key: key);

  final MainCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 30.0, end: 0),
      duration: const Duration(seconds: 30),
      builder: (context, value, child) {
        return Text(
          value.toInt() >= 10 ? 'this code will generate automatic in 00:${value.toInt()}'
              :'this code will generate automatic in 00:0${value.toInt()}',
          style: TextStyle(
            fontSize: 16.spMin,
            color: Colors.white,
          ),
        );
      },
      onEnd: () {
        isRegenerate = false;
        cubit.changeRegenerateState();
      },
    );
  }
}
