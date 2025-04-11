import 'package:expedier/auth/sign_in.dart';
import 'package:expedier/widgets/edt_pass.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';
import '../widgets/btn.dart';
import '../widgets/edt.dart';
import 'account_type.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _State();
}

class _State extends State<PersonalDetails> {

  TextEditingController fnController = TextEditingController();
  TextEditingController lnController = TextEditingController();
  TextEditingController phController = TextEditingController();
  TextEditingController ppController = TextEditingController();
  TextEditingController pcController = TextEditingController();
  TextEditingController rcController = TextEditingController();

  FocusNode fnFocus = FocusNode();
  FocusNode lnFocus = FocusNode();
  FocusNode phFocus = FocusNode();
  FocusNode ppFocus = FocusNode();
  FocusNode pcFocus = FocusNode();
  FocusNode rcFocus = FocusNode();

  bool isVis = true, isVis2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainClass.customAppBarWh(),
      body: Column(
        children: [
          MainClass.heading('Let\'s begin the journey.', context, false),
          Expanded(
            child: Padding(
              padding: MainClass.padA(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainClass.bH(16),
                    MainClass.txtB4('Full legal name', 14),
                    MainClass.bH(4),
                    Row(
                      children: [
                        Expanded(
                          child: Edt(
                              textController: fnController,
                              focusNode: fnFocus,
                              max: 64,
                              hint: 'First Name',
                              textInputType: TextInputType.name
                          ),
                        ),
                        MainClass.bW(12),
                        Expanded(
                          child: Edt(
                              textController: lnController,
                              focusNode: lnFocus,
                              max: 64,
                              hint: 'Last Name',
                              textInputType: TextInputType.name
                          ),
                        ),
                      ],
                    ),
                    MainClass.bH(16),
                    MainClass.txtB4('Mobile Number', 14),
                    MainClass.bH(4),
                    Container(
                      decoration: MainClass.conDecor(15, AppColor.colorApp, 1, Colors.white),
                      padding: MainClass.padS(1, 8),
                      child: Row(
                        children: [
                          Image.asset('assets/extras/ng.png', width: 20, height: 20),
                          MainClass.bW(4),
                          MainClass.txtCus3('(234)', 14, AppColor.colorAppGray42),
                          MainClass.bW(4),
                          Container(
                            height: 32,
                            width: 1,
                            color: AppColor.colorApp,
                          ),
                          MainClass.bW(4),
                          Expanded(
                            child: Edt(
                                focusNode: phFocus,
                                border: false,
                                max: 11,
                                hint: 'Enter Phone number',
                                textInputType: TextInputType.number,
                                borderColor: Colors.transparent,
                                textController: phController),
                          )
                        ],
                      ),
                    ),
                    MainClass.bH(16),
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
                        focusNode: ppFocus,
                        textController: ppController,
                        textInputType: TextInputType.text,
                        max: 32,
                        hint: 'Must be up to six characters',
                        chk: isVis),
                    MainClass.bH(16),
                    MainClass.txtB4('Confirm Password', 14),
                    MainClass.bH(4),
                    EdtPass(
                        onPress: (){
                          setState(() {
                            if (isVis2) {
                              isVis2 = false;
                            } else {
                              isVis2 = true;
                            }
                          });
                        },
                        focusNode: pcFocus,
                        textController: pcController,
                        textInputType: TextInputType.text,
                        max: 32,
                        hint: 'Re-enter password',
                        chk: isVis2),
                    MainClass.bH(16),
                    MainClass.txtB4('Referral code', 14),
                    MainClass.bH(4),
                    Edt(
                        textController: rcController,
                        focusNode: rcFocus,
                        max: 16,
                        hint: 'Referral code (optional)',
                        textInputType: TextInputType.text
                    ),
                    MainClass.bH(16),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: MainClass.padS(4, 16),
            child: Column(
              children: [
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
                              ..onTap = () => MainClass.open(context, SignIn()),
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
          MainClass.bH(24),
        ],
      ),
    );
  }

  validateInputs() {
    if(fnController.text.isEmpty){
      MainClass.err(context, 'First Name is required');
      fnFocus.requestFocus();
      return;
    }

    if(lnController.text.isEmpty){
      MainClass.err(context, 'Last Name is required');
      lnFocus.requestFocus();
      return;
    }

    if(phController.text.isEmpty){
      MainClass.err(context, 'Phone Number is required');
      phFocus.requestFocus();
      return;
    }

    if(phController.text.length < 10){
      MainClass.err(context, 'Phone Number is invalid');
      phFocus.requestFocus();
      return;
    }

    if(ppController.text.isEmpty){
      MainClass.err(context, 'Password is required');
      ppFocus.requestFocus();
      return;
    }

    if(ppController.text.length < 6){
      MainClass.err(context, 'Password must be up to six characters');
      ppFocus.requestFocus();
      return;
    }

    if(pcController.text.isEmpty){
      MainClass.err(context, 'Confirm Password is required');
      pcFocus.requestFocus();
      return;
    }

    if(ppController.text != pcController.text){
      MainClass.err(context, 'Password mismatch');
      ppFocus.requestFocus();
      return;
    }

    fnFocus.unfocus();
    lnFocus.unfocus();
    phFocus.unfocus();
    ppFocus.unfocus();
    pcFocus.unfocus();
    rcFocus.unfocus();

    MainClass.open(context, const AccountType());

  }

}
