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


String uId = '';







bool isRegenerate = false;

String languageApp = 'English';