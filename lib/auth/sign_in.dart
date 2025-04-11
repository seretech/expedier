import 'package:expedier/auth/sign_up.dart';
import 'package:expedier/classes/app_color.dart';
import 'package:expedier/nav/home_main.dart';
import 'package:expedier/widgets/btn.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:move_to_background/move_to_background.dart';

import '../classes/main_class.dart';
import '../nav/home.dart';
import '../widgets/edt.dart';
import '../widgets/edt_pass.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _State();
}

class _State extends State<SignIn> {

  LocalAuthentication localAuthentication = LocalAuthentication();

  TextEditingController emController = TextEditingController();
  TextEditingController paController = TextEditingController();

  FocusNode emFocus = FocusNode();
  FocusNode paFocus = FocusNode();

  bool isVis = true;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (b, v) {
        if(!b){
          MoveToBackground.moveTaskToBack();
          return;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset('assets/auth/sign_in_card.svg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/extras/logo.png', width: MainClass.devW(context, 10), height: MainClass.devW(context, 10)),
                    MainClass.bW(4),
                    Image.asset('assets/extras/app_name.png', width: MainClass.devW(context, 2)),
                  ],
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: MainClass.padA(16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainClass.txtB4('Welcome back!\nLet\'s pick up where you left off.', 20),
                      MainClass.bH(16),
                      MainClass.txtB4('Email', 14),
                      MainClass.bH(4),
                      Edt(
                          textController: emController,
                          focusNode: emFocus,
                          hint: 'email@gmail.com',
                          textInputType: TextInputType.emailAddress
                      ),
                      MainClass.bH(24),
                      MainClass.txtB4('Password', 14),
                      MainClass.bH(4),
                      EdtPass(
                          onPress: (){
                            setState(() {
                              if (isVis) {
                                isVis = false;
                              } else {
                                isVis = true;
                              }
                            });
                          },
                          focusNode: paFocus,
                          textController: paController,
                          hint: '......',
                          chk: isVis),
                      MainClass.bH(2),
                      Align(
                        alignment: Alignment.topRight,
                        child: MainClass.txtCus6('Forgot Password?', 14, AppColor.colorAppDark),
                      ),
                      MainClass.bH(24),
                      Row(
                        children: [
                          Expanded(
                            child: Btn(
                                onPressed: (){
                                  MainClass.open(context, const Home());
                                },
                                title: 'Log In'
                            ),
                          ),
                          MainClass.bW(12),
                          Container(
                            decoration: MainClass.conDecor(16, AppColor.colorApp, 2, Colors.white),
                            child: InkWell(
                              onTap: () => loginChk(context),
                              child: Padding(
                                padding: MainClass.padA(12),
                                child: SvgPicture.asset('assets/auth/bio.svg', width: 28, height: 28),
                              ),
                            ),
                          )
                        ],
                      ),
                      MainClass.bH(12),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: GoogleFonts.rubik(color: AppColor.colorAppGray42, fontSize: 13, fontWeight: FontWeight.w300),
                            children: <TextSpan>[
                              TextSpan(text: 'Don’t have an account? '),
                              TextSpan(text: 'Get Started',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => MainClass.open(context, const SignUp()),
                                  style: GoogleFonts.rubik(color: AppColor.colorAppDark, fontSize: 14,
                                      fontWeight: FontWeight.w500)
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  validateInputs() {
    if(emController.text.isEmpty){
      MainClass.err(context, 'Email Address is required');
      emFocus.requestFocus();
      return;
    }

    if(!MainClass.isEmailValid(emController.text)){
      MainClass.err(context, 'Email Address is invalid');
      emFocus.requestFocus();
      return;
    }

    if(paController.text.isEmpty){
      MainClass.err(context, 'Password is required');
      paFocus.requestFocus();
      return;
    }

    emFocus.unfocus();
    paFocus.unfocus();

    MainClass.open(context, const HomeMain());

  }

  loginChk(ctx) async {
    try {
      final bool auth = await localAuthentication.authenticate(
        localizedReason: 'Use your fingerprint to verify your identity',
        options: const AuthenticationOptions(biometricOnly: true),
      );

      if(auth){
        MainClass.open(ctx, HomeMain());
      }

    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        debugPrint(e.code);
      } else if (e.code == auth_error.notEnrolled) {
        debugPrint(e.code);
      } else {
        debugPrint(e.toString());
      }
    }
  }

}
