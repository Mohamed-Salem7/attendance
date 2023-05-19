import 'dart:io';

import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/network/dio_helper.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/state.dart';
import 'package:attendance_app/model/UserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitAuthState());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool isPasswordVisibility = false;

  void changeVisibilityPassword() {
    isPasswordVisibility = !isPasswordVisibility;
    emit(ChangeVisibilityPasswordState());
  }

  int index = 0;

  void changeSelectRegister(value) {
    index = value;
    emit(ChangeSelectRegisterState());
  }

  String uId = '';

  // Future<void> createAccount({
  //   required String email,
  //   required String name,
  //   required String mobile,
  //   required String type,
  //   required String password,
  // }) async{
  //   emit(LoadingCreateNewUserState());
  //   await DioHelper.postData(
  //     url: '/user',
  //     data: {
  //       'type' : type,
  //       'name' : name,
  //       'mobile' : mobile,
  //       'email' : email,
  //       'password' : password,
  //       'password_confirmation' : password,
  //     },
  //   ).then((value) {
  //     uId = mobile;
  //     emit(SuccessCreateNewUserState());
  //   }).catchError((e){
  //     emit(ErrorCreateNewUserState());
  //   });
  // }

  Future<void> createAccount({
    required String email,
    required String name,
    required String mobile,
    required String type,
    required String password,
  }) async {
    emit(LoadingCreateNewUserState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      uId = email;
      await sendDataUserToFirebase(
          email: email, name: name, mobile: mobile, type: type);

      emit(SuccessCreateNewUserState());
    }).catchError((e) {
      emit(ErrorCreateNewUserState());
    });
  }

  Future<void> sendDataUserToFirebase({
    required String email,
    required String name,
    required String mobile,
    required String type,
  }) async {
    emit(LoadingCreateNewUserState());
    await FirebaseFirestore.instance.collection('users').doc(email).set({
      'email': email,
      'name': name,
      'mobile': mobile,
      'type': type,
      'avatar': '',
    }).then((value) {
      emit(SuccessCreateNewUserState());
    }).catchError((e) {
      emit(ErrorCreateNewUserState());
    });
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginUserState());

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uId = email;
      emit(SuccessLoginUserState());
    }).catchError((e) {
      emit(ErrorLoginUserState());
    });
  }

  Future<void> updateProfileUser({
    required String name,
    required String mobile,
  }) async {
    emit(LoadingUpdateProfileUserState());
    await FirebaseFirestore.instance.collection('users').doc(uIds).update({
      'name': name,
      'mobile': mobile,
    }).then((value) {
      emit(SuccessUpdateProfileUserState());
    }).catchError((e) {
      emit(ErrorUpdateProfileUserState());
    });

    for(int i = 0; i < listCourseStudentModel.length ; i++)
    {
      await FirebaseFirestore.instance
          .collection('course')
          .doc(listCourseStudentModel[i].courseId)
          .collection('attendance')
          .doc(uIds)
          .update({
        'name': name,
        'avatar': userData!.avatar,
      }).then((value) {
        emit(SuccessUpdateProfileUserState());
      }).catchError((e) {
        emit(ErrorUpdateProfileUserState());
      });
    }
  }

  Future<String> _storeFileToFirebase(String path, File file) async {
    UploadTask uploadTask =
        FirebaseStorage.instance.ref().child(path).putFile(file);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> uploadAvatar() async {
    emit(LoadingUploadAvatarUserState());
    String photoUrl = await _storeFileToFirebase(
        'file/${imagePicker!.name}', File(imagePicker!.path!));
    emit(SuccessUploadAvatarUserState());
    await FirebaseFirestore.instance.collection('users').doc(uIds).update({
      'avatar': photoUrl,
    });
  }

// Future<void> loginUser({
//   required String mobile,
//   required String password,
// }) async {
//   emit(LoadingLoginUserState());
//   await DioHelper.postData(
//     url: '/auth/login',
//     data: {
//       'mobile': mobile,
//       'password': password,
//     },
//   ).then((value) {
//     uId = mobile;
//     emit(SuccessLoginUserState());
//   }).catchError((e) {
//     emit(ErrorLoginUserState());
//   });
// }
}
