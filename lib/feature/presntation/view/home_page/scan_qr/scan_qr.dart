import 'dart:developer';
import 'dart:io';

import 'package:attendance_app/core/utils/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({Key? key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: AppColor.primary2Color,
      appBar: AppBar(
        backgroundColor: AppColor.primary2Color,
        title: Text('Scan Qr Code'),
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
                      onPressed: ()
                      async{
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      icon:FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return Icon(
                            snapshot.data == false ? Icons.flash_off : Icons.flash_on,
                            size: 30.spMin,
                            color: Colors.white,
                          );
                        },
                      )
                    ),
                  ),
                  PositionedDirectional(
                    start: 10.w,
                    bottom: 20.h,
                    child: IconButton(
                      onPressed: ()
                      async {
                        await controller?.pauseCamera();
                      },
                      icon:LineIcon.pause(size: 30.spMin,
                        color: Colors.white,),
                    ),
                  ),
                  PositionedDirectional(
                    start: 40.w,
                    bottom: 20.h,
                    child: IconButton(
                      onPressed: ()
                      async {
                        await controller?.resumeCamera();
                      },
                      icon:LineIcon.play(size: 30.spMin,
                        color: Colors.white,),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: {${result!.code}}')
                  else
                    const Text('Scan a code'),
                ],
              ),
            ),
          )
        ],
      ),
    );
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
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
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
