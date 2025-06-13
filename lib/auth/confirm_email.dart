import 'package:expedier/auth/personal_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';
import '../widgets/btn.dart';

class ConfirmEmail extends StatefulWidget {
  const ConfirmEmail({super.key});

  @override
  State<ConfirmEmail> createState() => _State();
}

class _State extends State<ConfirmEmail> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: MainClass.customAppBarWh(),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            MainClass.heading('', context, false),
            Expanded(
              child: Padding(
                padding: MainClass.padA(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MainClass.bH(MainClass.devH(context, 16)),
                    Center(child: SvgPicture.asset('assets/auth/confirm_email.svg', width: MainClass.devW(context, 2), height: MainClass.devH(context, 3))),
                    MainClass.bH(MainClass.devH(context, 16)),
                    MainClass.txtCus4('Confirm Your email', 24, AppColor.colorAppGray21),
                    MainClass.bH(4),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.rubik(color: AppColor.colorAppGray42, fontSize: 16, fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(text: 'We have just sent an email to \n'),
                          TextSpan(text: 'email@gmail.com',
                              style: GoogleFonts.rubik(color: AppColor.colorAppDark, fontSize: 16,
                                  fontWeight: FontWeight.w400)
                          ),
                        ],
                      ),
                    ),
                    MainClass.bH(MainClass.devH(context, 12)),
                    Btn(onPressed: (){
                      MainClass.open(context, PersonalDetails());
                    }, title: 'Continue'),
                    MainClass.bH(24),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.rubik(color: AppColor.colorAppGray42, fontSize: 14, fontWeight: FontWeight.w300),
                        children: <TextSpan>[
                          TextSpan(text: 'I '),
                          TextSpan(text: 'didn’t receive ', style: GoogleFonts.rubik(color: AppColor.colorAppDark, fontSize: 14,
                              fontWeight: FontWeight.w400)),
                          TextSpan(text: 'my email ',
                              style: GoogleFonts.rubik(color: AppColor.colorAppGray42, fontSize: 14,
                                  fontWeight: FontWeight.w300)
                          ),
                        ],
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
