import 'package:attendance_app/core/function/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyRecord extends StatelessWidget {
  BodyRecord(
      {Key? key,
      required this.course,
      required this.date,
      required this.day,
      this.courseAr,
      this.dateAr,
      this.dayAr, required this.isRecord})
      : super(key: key);

  final String course;
  String? courseAr;
  final String date;
  String? dateAr;
  final String day;
  String? dayAr;

  final bool isRecord;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: languageApp == 'Arabic' ? TextDirection.rtl : TextDirection.ltr,
      child: Row(
        children: [
          Text(
            isRecord ? course : languageApp == 'Arabic' ? courseAr! : course,
            style: TextStyle(
              fontSize:  isRecord ? 18.spMin:26.spMin,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Text(
            isRecord ? day :languageApp == 'Arabic' ? dayAr! : day,
            style: TextStyle(
              fontSize: isRecord ? 18.spMin:26.spMin,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Text(
            isRecord ? date :languageApp == 'Arabic' ? dateAr! : date,
            style: TextStyle(
              fontSize: isRecord ? 18.spMin:26.spMin,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
