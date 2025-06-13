import 'package:expedier/auth/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';
import '../widgets/btn.dart';
import 'expedier_use.dart';

class AccountType extends StatefulWidget {
  const AccountType({super.key});

  @override
  State<AccountType> createState() => _State();
}

class _State extends State<AccountType> {

  bool chk1 = false, chk2 = false, chk3 = false, chk4 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: MainClass.customAppBarWh(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            MainClass.heading('Choose account type', context, false),
            Expanded(
              child: Padding(
                padding: MainClass.padA(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   InkWell(
                     onTap: (){
                       setState(() {
                         chk1 = true;
                         chk2 = false;
                         chk3 = false;
                         chk4 = false;
                       });
                     },
                     child:  MainClass.typeCard('Personal Account', 'Personal accounts with super perks', chk1),
                   ),
                    MainClass.bH(16),
                   InkWell(
                     onTap: (){
                       setState(() {
                         chk1 = false;
                         chk2 = true;
                         chk3 = false;
                         chk4 = false;
                       });
                     },
                     child:  MainClass.typeCard('Business Account', 'For Businesses powered by extra perks', chk2),
                   ),
                    MainClass.bH(16),
                    InkWell(
                      onTap: (){
                        setState(() {
                          chk1 = false;
                          chk2 = false;
                          chk3 = true;
                          chk4 = false;
                        });
                      },
                      child:  MainClass.typeCard('Internal Users', 'Internal Users', chk3),
                    ),
                    MainClass.bH(16),
                    InkWell(
                      onTap: (){
                        setState(() {
                          chk1 = false;
                          chk2 = false;
                          chk3 = false;
                          chk4 = true;
                        });
                      },
                      child:  MainClass.typeCard('New Immigrant / Student Account', 'Great account for recent immigrations', chk4),
                    ),
                    MainClass.bH(MainClass.devH(context, 8)),
                    Btn(onPressed: () {
                      if(chk1 == false && chk2 == false && chk3 == false && chk4 == false){
                        MainClass.err(context, 'Please select at least one option');
                        return;
                      }
                      MainClass.open(context, const ExpedierUse());
                    }, title: 'Continue'),
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
            )
          ],
        ),
      ),
    );
  }

}
