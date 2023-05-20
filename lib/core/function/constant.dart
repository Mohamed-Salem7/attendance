import 'package:attendance_app/model/AttendanceModel.dart';
import 'package:attendance_app/model/CourseModel.dart';
import 'package:attendance_app/model/GetCourseToStudentModel.dart';
import 'package:attendance_app/model/UserData.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void navigatorFinished(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) {
    return false;
  },
);


String uIds = '';


String image = '';
PlatformFile? imagePicker;

List<CourseModel> listCourseModel = [];
List<CourseModel> listCourseStudentModel = [];
CourseModel? courseModel;

List<GetCourseToStudentModel> studentCourseModel = [];
GetCourseToStudentModel? studentCourse;


List<String> member = [];



String qrCode = '';
List<String> qrCodeSplit = [];
String uIdStudent = '';

UserData? userData;

AttendanceModel? attendanceModel;

List<AttendanceModel> listAttendanceModel = [];

List<TextDirection> textDirection =
[TextDirection.rtl,TextDirection.ltr];


bool isRegenerate = false;

String languageApp = 'English';