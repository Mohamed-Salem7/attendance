import 'dart:io';

import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/app_images/images_manager.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/auth_cubit/state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateImageUser extends StatefulWidget {
  const UpdateImageUser({Key? key}) : super(key: key);

  @override
  State<UpdateImageUser> createState() => _UpdateImageUserState();
}

class _UpdateImageUserState extends State<UpdateImageUser> {
  @override
  Widget build(BuildContext context) {


    return BlocConsumer<AuthCubit,AuthState>(
        builder: (context, state) {

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  if (imagePicker != null)
                    CircleAvatar(
                      radius: 65.r,
                      backgroundImage: FileImage(File(imagePicker!.path!)),
                    ),
                  if (imagePicker == null)
                    CircleAvatar(
                      radius: 65.r,
                      backgroundImage: const AssetImage(AppImage.user),
                    ),
                  PositionedDirectional(
                    top: 90.h,
                    start: 90.w,

                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () async {
                          final picker = await FilePicker.platform.pickFiles();
                          imagePicker = picker!.files.first;
                          setState(() {
                            image = imagePicker!.name;
                          });
                          AuthCubit.get(context).uploadAvatar();
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        listener: (context, state) {});
  }
}
