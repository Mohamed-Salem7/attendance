import 'dart:developer';
import 'dart:io';

import 'package:attendance_app/core/function/constant.dart';
import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/cubit.dart';
import 'package:attendance_app/feature/presntation/controllers/main_cubit/state.dart';
import 'package:attendance_app/feature/presntation/view/main_layout/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({
    Key? key,
    required this.courseId,
  }) : super(key: key);

  final String courseId;

  @override
  State<StatefulWidget> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColor.primary2Color,
        appBar: AppBar(
          backgroundColor: AppColor.primary2Color,
          title: const Text('Scan Qr Code'),
          leading: IconButton(
              onPressed: () {
                navigatorFinished(context, const MainLayout());
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    _buildQrView(context),
                    PositionedDirectional(
                      end: 10.w,
                      bottom: 20.h,
                      child: IconButton(
                          onPressed: () async {
                            await controller?.toggleFlash();
                            setState(() {});
                          },
                          icon: FutureBuilder(
                            future: controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              return Icon(
                                snapshot.data == false
                                    ? Icons.flash_off
                                    : Icons.flash_on,
                                size: 30.spMin,
                                color: Colors.white,
                              );
                            },
                          )),
                    ),
                    PositionedDirectional(
                      start: 10.w,
                      bottom: 20.h,
                      child: IconButton(
                        onPressed: () async {
                          await controller?.pauseCamera();
                        },
                        icon: LineIcon.pause(
                          size: 30.spMin,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 40.w,
                      bottom: 20.h,
                      child: IconButton(
                        onPressed: () async {
                          await controller?.resumeCamera();
                        },
                        icon: LineIcon.play(
                          size: 30.spMin,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      );
    }, listener: (context, state) {
      if (state is SuccessRecordAttendanceStudentState) {
        navigatorFinished(context, const MainLayout());


      }
    });
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = 200.h;

    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    bool isShow = true;

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        qrCode = result!.code! ?? '';
        qrCodeSplit = qrCode.split(',');
        uIdStudent = qrCodeSplit[1];
      });

      MainCubit.get(context).getAttendanceStudentForTeacher(
        uId: uIdStudent,
        courseId: widget.courseId,
      );

      print(uIdStudent);

      DateTime dateTime = DateTime.now();
      String dateCompare = DateFormat.Md().format(dateTime);
      List<String> dates = [];
      dates = dateCompare.split('/');
      int monthNow = int.parse(dates[0]);
      int dayNow = int.parse(dates[1]);

      bool isSend = false;

      if (uIdStudent != null && isShow) {
        if (listAttendanceModel.length == 0) {
          isSend = true;
          isShow = false;
        }

        for (int i = 0; i < listAttendanceModel.length; i++) {
          DateTime times = DateTime.parse(listAttendanceModel[i].time!);
          String date = DateFormat.Md().format(times);
          List<String> dateList = [];
          dateList = date.split('/');
          int month = int.parse(dateList[0]);
          int day = int.parse(dateList[1]);

          if (monthNow > month) {
            if (dayNow == 1) {
              isSend = true;
              isShow = false;
            }
          }

          if (monthNow == month) {
            if (dayNow > day) {
              isSend = true;
              isShow = false;
            }
          }
          if (isSend) break;
        }
      }

      if (isSend) {
        for (int i = 0; i < studentCourseModel.length; i++) {
          if (studentCourseModel[i].courseId == widget.courseId) {
            MainCubit.get(context).recordAttendance(
              courseId: widget.courseId,
              uIds: uIdStudent,
              data: qrCode,
            );


          } else {}
        }
        isSend = false;
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
