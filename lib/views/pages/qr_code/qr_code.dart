

import 'dart:developer';
import 'dart:io' show Platform;
import 'package:draw_idea/views/pages/Deals/category_screen.dart';
import 'package:draw_idea/views/pages/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/style.dart';
import '../detail_pages/details_page.dart';
import '../home/main_screen.dart';
import '../register_login/welcome_page.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isflash = false;
  final title = "";
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (controller != null && mounted && !isflash) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }

    return   WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        // appBar:
        // appBar(context, backbutton: true, icon: true, notifications: true),
        body: Container(
          padding: EdgeInsets.only(top: 0),
          child: Stack(
            children: <Widget>[
              _buildQrView(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  // if (result != null)
                  //   Text(
                  //     'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}',
                  //     style: const TextStyle(color: Colors.white),
                  //   )
                  // else
                  //   const Text('Scan a code'),
                  Container(

                    height: 220,
                    // color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () async {
                            isflash = !isflash;
                            await controller?.toggleFlash();
                            // setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                return snapshot.data == false
                                    ? const Icon(
                                  Icons.flash_off,
                                  color: Style.whitecolor,

                                )
                                    : const Icon(Icons.flash_on, color: Style.whitecolor);
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),

                        GestureDetector(
                          onTap: () async {
                            Get.back();
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            if (FirebaseAuth.instance.currentUser != null ) {
                              Get.to( MainScreen());
                              prefs?.setBool("guest", false);
                              prefs?.setBool("isLoggedIn", true);
                            }else{
                              logoutUser();
                            }
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Style.whitecolor),
                              borderRadius: BorderRadius.circular(50)

                            ),
                            margin: const EdgeInsets.all(8),
                            child:Center(
                              child: Text("Skip",style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Style.whitecolor,
                                  fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: () async {
                            await controller?.flipCamera();
                            // setState(() {});
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  return const Icon(Icons.cameraswitch_rounded,
                                      color: Style.whitecolor);
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs?.setBool("guest", true);
    prefs?.setBool("isLoggedIn", true);
    Get.to(HomeScreen());
  }
  Widget _buildQrView(BuildContext context) {
    var scanArea = (Get.width < 300 || Get.height < 300) ? 300.0 : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Style.whitecolor,
          borderRadius: 10,
          borderLength: 35,
          borderWidth: 10,
          overlayColor: Colors.black87,
          cutOutBottomOffset: 120,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController qrcontroller) {
    setState(() {
      this.controller = qrcontroller;
    });
    qrcontroller.scannedDataStream.listen((scanData) async{
      // if(scanData.code == "https://www.raffle-draw.com"){
      //   print(":::::: ghfghhghfghg::::::::");
      //   controller?.pauseCamera();
      //
      //   await Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) {
      //       return Details();
      //     }),
      //   );
      //   return;
      // }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(":::::::::::::::::::::::::::::::");
      print(FirebaseAuth.instance.currentUser);
      if (FirebaseAuth.instance.currentUser != null ) {
        print(":::::::::::::::::::::::::::::::");
        print(FirebaseAuth.instance.currentUser);
        controller?.pauseCamera();
        prefs?.setBool("guest", false);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details();
          }),
        );

      }else{
        controller?.pauseCamera();
        prefs?.setBool("guest", true);

        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details();
          }),
        );

      }

      // if (scanData != null) {
      //   setState(() {
      //     result = scanData;
      //   });
        // await controller?.stopCamera();
        // Get.to(HomeScreen());
        // Get.find<QRService>().updateResult(scanData.code);

        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('${scanData.code}'),
        // ));
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // bool _user = (prefs.getBool('user') ?? false);
        // var status = prefs.getBool('isLoggedIn') ?? false;

        // if (_user) {
        //
        //     await controller?.stopCamera();
        //
        //
        //   Get.to(HomeScreen());
        //
        //
        //   prefs?.setBool("guest", false);
        //   prefs?.setBool("isLoggedIn", true);
        // } else if (_user) {
        //   Get.to(WelcomeScreen());
        // } else {
        //
        //
        // }


        // Get.to(HomeScreen());
        // Get.snackbar(
        //   "${scanData.code}",
        //   "Successfull",
        //   icon: Icon(Icons.person, color: Style.whitecolor),
        //   snackPosition: SnackPosition.TOP,
        // );
        //
        // Get.back();
        // Get.offAll(() =>  HomeScreen());
      // }
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