import 'package:camera/camera.dart';
import 'package:expedier/auth/selfie_capture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';
import '../widgets/btn.dart';

class SelfieVerify extends StatefulWidget {
  const SelfieVerify({super.key});

  @override
  State<SelfieVerify> createState() => _State();
}

class _State extends State<SelfieVerify> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainClass.customAppBarWh(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          MainClass.heading('Selfie verification', context, true),
          Padding(
            padding: MainClass.padA(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainClass.bH(4),
                Text('We will complete the photo in your document with your selfie to confirm your identity', textAlign: TextAlign.center, style: GoogleFonts.rubik(fontWeight: FontWeight.w300, fontSize: 14, color:  AppColor.colorAppGray42)),
                MainClass.bH(16),
                Center(child: Image.asset('assets/auth/face_ver.png', width: MainClass.devW(context, 1.5), height: MainClass.devH(context, 2),)),
                MainClass.bH(16),
                Container(
                  decoration: MainClass.conDeco(14, AppColor.colorAppGray7),
                  padding: MainClass.padA(14),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/extras/lock.svg'),
                      MainClass.bW(8),
                      Expanded(child: MainClass.txtCus3('The data you share will be encrypted, stored securely, and only used to verify your identity.', 14, AppColor.colorAppGray42)),
                    ],
                  ),
                ),
                MainClass.bH(16),
                Btn(onPressed: () => MainClass.open(context, const SelfieCapture(camera: CameraDescription(name: 'Expedier', lensDirection: CameraLensDirection.front, sensorOrientation: 270))), title: 'Open Camera'),
                MainClass.bH(4),
              ],
            ),
          )
        ],
      ),
    );
  }

}
