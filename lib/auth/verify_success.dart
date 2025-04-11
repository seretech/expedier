import 'package:expedier/auth/personal_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';
import '../widgets/btn.dart';
import 'selfie_verify.dart';

class VerifySuccess extends StatefulWidget {
  final bool chk;
  const VerifySuccess({super.key, required this.chk});

  @override
  State<VerifySuccess> createState() => _State();
}

class _State extends State<VerifySuccess> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Center(child: SvgPicture.asset('assets/auth/ver.svg', width: MainClass.devW(context, 2.5), height: MainClass.devH(context, 4))),
                  MainClass.bH(MainClass.devH(context, 16)),
                  MainClass.txtCus4('Verification Success', 24, AppColor.colorAppGray21),
                  MainClass.bH(4),
                  Text('Congratulations your account is ready to use, now you can start trading cryptocurrency', textAlign: TextAlign.center, style: GoogleFonts.rubik(fontWeight: FontWeight.w300, fontSize: 14, color:  AppColor.colorAppGray42)),
                  MainClass.bH(32),
                  Btn(onPressed: (){
                    MainClass.open(context, widget.chk ? const SelfieVerify() : const PersonalDetails());
                  }, title: 'Start Now'),
                  MainClass.bH(4),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}
