import 'package:camera/camera.dart';
import 'package:expedier/auth/verify_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  final firstCamera = cameras.first;
  runApp(SelfieCapture(camera: firstCamera));

}

class SelfieCapture extends StatefulWidget {

  final CameraDescription camera;

  const SelfieCapture({super.key, required this.camera});

  @override
  State<SelfieCapture> createState() => _State();
}

class _State extends State<SelfieCapture> {

  late CameraController cameraController;
  late Future<void> controllerFuture;

  XFile? imageFile;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    controllerFuture = cameraController.initialize();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainClass.customAppBarDk(),
      backgroundColor: AppColor.colorAppDarker,
      body: Column(
        children: [
          Container(
              width: double.infinity,
              padding: MainClass.padA(8),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Container(
                        padding: MainClass.padA(12),
                        decoration: MainClass.conDecor(8, AppColor.colorApp, 1, Colors.transparent),
                        child: SvgPicture.asset('assets/extras/ar_back.svg', width: 16, height: 16)),
                    MainClass.bW(12),
                    Expanded(child: Center(child: MainClass.txtCus4('Selfie verification', 20, Colors.white))),
                    MainClass.bW(28),
                  ],
                ),
              )
          ),
          Expanded(
            child: Padding(
              padding: MainClass.padA(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainClass.bH(4),
                  Text('Hold your phone at eye level and look directly into the camera,when the frame turns blue take a photo', textAlign: TextAlign.center, style: GoogleFonts.rubik(fontWeight: FontWeight.w300, fontSize: 14, color:  AppColor.colorAppGray31)),
                  MainClass.bH(16),
                  Expanded(
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              top: 8,
                              left: 2,
                              child: SvgPicture.asset('assets/auth/arc.svg')),
                          Positioned(
                              top: 8,
                              right: 2,
                              child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationY(3.1416),
                              child: SvgPicture.asset('assets/auth/arc.svg'))),
                          Positioned(
                              bottom: 8,
                              left: 2,
                              child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationX(3.1416),
                              child: SvgPicture.asset('assets/auth/arc.svg'))),
                          Positioned(
                              bottom: 8,
                              right: 2,
                              child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationZ(3.1416),
                              child: SvgPicture.asset('assets/auth/arc.svg'))),
                          FutureBuilder<void>(
                            future: controllerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.done) {
                                return Container(
                                  margin: MainClass.padS(12, 6),
                                  padding: MainClass.padA(4),
                                  width: double.infinity,
                                  height: MainClass.devH(context, 1.8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: CameraPreview(cameraController),
                                  ),
                                );
                              } else {
                                return Center(child: CircularProgressIndicator(color: Colors.white));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  MainClass.bH(16),
                  InkWell(
                    onTap: () => takeSelfie(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: MainClass.padA(6),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: AppColor.colorAppDark2,
                            width: 2,
                          )
                        ),
                        padding: MainClass.padA(28),
                      ),
                    ),
                  ),
                  MainClass.bH(24),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  takeSelfie() {
    cameraController.takePicture().then((XFile? file) {
      if (mounted) {
        setState(() {
          imageFile = file;
        });
        if (file != null) {
          MainClass.sus(context, 'Selfie captured successfully');
          MainClass.open(context, const VerifySuccess(chk: false));
        }
      }
    });
  }

}
