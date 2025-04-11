import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';
import '../widgets/btn.dart';
import '../widgets/edt.dart';
import 'otp_verify.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _State();
}

class _State extends State<SignUp> {

  TextEditingController emController = TextEditingController();

  FocusNode emFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset('assets/auth/sign_up_card.svg'),
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
          Padding(
            padding: MainClass.padA(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainClass.txtB4('Your financial journey begins here.\nReady to take off?', 20),
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
                Btn(
                    onPressed: () => validateInputs(),
                    title: 'Continue'
                ),
                MainClass.bH(12),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.rubik(color: AppColor.colorAppGray42, fontSize: 13, fontWeight: FontWeight.w300),
                      children: <TextSpan>[
                        TextSpan(text: 'Already have an account? '),
                        TextSpan(text: 'Sign In',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pop(context),
                            style: GoogleFonts.rubik(color: AppColor.colorAppDark, fontSize: 14,
                                fontWeight: FontWeight.w500)
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
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

    emFocus.unfocus();

    MainClass.open(context, OTPVerify(em: emController.text.toString()));

  }

}
