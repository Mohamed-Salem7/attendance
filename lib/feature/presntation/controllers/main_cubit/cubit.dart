import 'dart:math';

import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/network/cache_helper.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/home_page/home_screen.dart';
import 'package:attendance_app/feature/presntation/view/notification_page/notification_screen.dart';
import 'package:attendance_app/feature/presntation/view/setting_page/setting_screen.dart';
import 'package:attendance_app/model/CourseModel.dart';
import 'package:attendance_app/model/GetCourseToStudentModel.dart';
import 'package:attendance_app/model/UserData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitMainState());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeIndexScreenState());
  }

  List<Widget> screen = [
    const HomeScreen(),
    const NotificationScreen(),
    const SettingScreen(),
  ];

  bool isRegenerate = false;

  void changeRegenerateState() {
    isRegenerate = true;
    emit(LoadingGenerateQrCodeState());
  }

  bool isSelect = false;

  String qrCode = '';

  String generateRandomString(int length) {
    var rand = Random();
    var codeUnits = List.generate(
        length,
        (index) =>
            rand.nextInt(26) + 97); //// Generates a random lowercase letter
    if (isSelect) {
      emit(SuccessGenerateQrCodeState());
      isSelect = false;
    }
    qrCode = String.fromCharCodes(codeUnits);
    return String.fromCharCodes(codeUnits);
  }

  Future<void> getUserData() async {
    emit(LoadingGetUserDataState());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uIds)
        .get()
        .then((value) {
      userData = UserData.fromJson(value.data()!);
      emit(SuccessGetUserDataState());
    }).catchError((e) {
      emit(ErrorGetUserDataState());
    });
  }

  Future<void> createSectionCourse({
    required String name,
    required String lectureDate,
    required String timingFromLecture,
    required String timingToLecture,
    required String courseId,
  }) async {
    emit(LoadingAddNewSectionCourseState());
    await FirebaseFirestore.instance.collection('course').doc(courseId).set({
      'name': name,
      'lectureDate': lectureDate,
      'timingFromLecture': timingFromLecture,
      'timingToLecture': timingToLecture,
      'courseId': courseId,
      'drName': userData!.name,
    }).then((value) {
      emit(SuccessAddNewSectionCourseState());
    }).catchError((e) {
      emit(ErrorAddNewSectionCourseState());
    });
  }

  Future<void> getSectionCourse() async {
    emit(LoadingGetSectionCourseState());
    await FirebaseFirestore.instance.collection('course').get().then((value) {
      listCourseModel = [];
      if (userData!.type == '2') {
        value.docs.forEach((element) {
          if (element.data()['drName'] == userData!.name) {
            courseModel = CourseModel.fromJson(element.data());
            listCourseModel.add(courseModel!);
          }
        });
      }
      listCourseStudentModel = [];
      if (userData!.type == '3') {
        value.docs.forEach((element) {
          courseModel = CourseModel.fromJson(element.data());
          listCourseStudentModel.add(courseModel!);
        });
      }
      emit(SuccessGetSectionCourseState());
    }).catchError((error) {
      emit(ErrorGetSectionCourseState());
    });
  }

  Future<void> joinToCourse({
    required String courseId,
    required String name,
    required String drName,
    required List<String> members,
  }) async {
    emit(LoadingJoinSectionCourseState());
    member = members;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uIds)
        .collection('course')
        .doc()
        .set({
      'name': name,
      'courseId': courseId,
      'time joined': DateTime.now().toString(),
      'drName': drName,
    }).then((value) {
      emit(SuccessJoinSectionCourseState());
    }).catchError((error) {
      emit(ErrorJoinSectionCourseState());
    });

    member.add(userData!.email!);
    await FirebaseFirestore.instance.collection('course').doc(courseId).update({
      'member': member,
    }).then((value) {
      emit(SuccessJoinSectionCourseState());
    }).catchError((error) {
      emit(ErrorJoinSectionCourseState());
    });
  }

  Future<void> getJoinedClasses() async {
    emit(LoadingGetSectionCourseToStudentState());
    studentCourseModel = [];
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uIds)
        .collection('course')
        .get()
        .then((value) {
          value.docs.forEach((element) {
            studentCourse = GetCourseToStudentModel.fromJson(element.data());
            studentCourseModel.add(studentCourse!);
          });
          print(studentCourseModel.length);
          emit(SuccessGetSectionCourseToStudentState());
    }).catchError((error){
      emit(ErrorGetSectionCourseToStudentState());
    });
  }

  void stateHome() {
    emit(HomeScreenState());
  }
}
