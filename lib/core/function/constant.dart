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


UserData? userData;




bool isRegenerate = false;

String languageApp = 'English';