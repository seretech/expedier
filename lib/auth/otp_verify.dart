import 'dart:async';

import 'package:expedier/auth/verify_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';
import '../widgets/btn.dart';

class OTPVerify extends StatefulWidget {
  final String em;
  const OTPVerify({super.key, required this.em});

  @override
  State<OTPVerify> createState() => _State();
}

class _State extends State<OTPVerify> {

  int c = 30;
  late Timer timer;
  bool retry = false;

  String v1 = '', v2 = '', v3 = '', v4 = '', v5 = '';

  TextEditingController v1Controller = TextEditingController();
  TextEditingController v2Controller = TextEditingController();
  TextEditingController v3Controller = TextEditingController();
  TextEditingController v4Controller = TextEditingController();
  TextEditingController v5Controller = TextEditingController();

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();
  FocusNode node3 = FocusNode();
  FocusNode node4 = FocusNode();
  FocusNode node5 = FocusNode();

  @override
  void initState() {
    startCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainClass.customAppBarWh(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          MainClass.heading('OTP', context, true),
          Padding(
            padding: MainClass.padA(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainClass.bH(4),
                MainClass.txtB4('Enter OTP Code', 20),
                MainClass.bH(4),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    style: GoogleFonts.rubik(color: AppColor.colorAppGray42, fontSize: 14, fontWeight: FontWeight.w300),
                    children: <TextSpan>[
                      TextSpan(text: 'We have just sent a code to '),
                      TextSpan(text: widget.em,
                          style: GoogleFonts.rubik(color: AppColor.colorAppDark, fontSize: 14,
                              fontWeight: FontWeight.w300)
                      ),
                    ],
                  ),
                ),
                MainClass.bH(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: MainClass.conDecor(15, AppColor.colorApp, 1, Colors.white),
                        width: MainClass.devW(context, 7),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(color: AppColor.colorAppDark, fontSize: 32, fontWeight: FontWeight.w400),
                          cursorColor: AppColor.colorAppDark,
                          cursorHeight: 32,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: v1Controller,
                          focusNode: node1,
                          onChanged: (text) {
                            setState(() {
                              if (text.length == 1) {
                                FocusScope.of(context).requestFocus(node2);
                                v1 = text;
                              }
                            });
                          },
                        )
                    ),
                    Container(
                        decoration: MainClass.conDecor(15, AppColor.colorApp, 1, Colors.white),
                        width: MainClass.devW(context, 7),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(color: AppColor.colorAppDark, fontSize: 32, fontWeight: FontWeight.w400),
                          cursorColor: AppColor.colorAppDark,
                          cursorHeight: 32,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: v2Controller,
                          focusNode: node2,
                          onChanged: (text) {
                            setState(() {
                              if (text.length == 1) {
                                FocusScope.of(context).requestFocus(node3);
                                v2 = text;
                              } else {
                                FocusScope.of(context).requestFocus(node1);
                              }
                            });
                          },
                        )
                    ),
                    Container(
                        decoration: MainClass.conDecor(15, AppColor.colorApp, 1, Colors.white),
                        width: MainClass.devW(context, 7),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(color: AppColor.colorAppDark, fontSize: 32, fontWeight: FontWeight.w400),
                          cursorColor: AppColor.colorAppDark,
                          cursorHeight: 32,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: v3Controller,
                          focusNode: node3,
                          onChanged: (text) {
                            setState(() {
                              if (text.length == 1) {
                                FocusScope.of(context).requestFocus(node4);
                                v3 = text;
                              }
                              else {
                                FocusScope.of(context).requestFocus(node2);
                              }
                            });
                          },
                        )
                    ),
                    Container(
                        decoration: MainClass.conDecor(15, AppColor.colorApp, 1, Colors.white),
                        width: MainClass.devW(context, 7),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(color: AppColor.colorAppDark, fontSize: 32, fontWeight: FontWeight.w400),
                          cursorColor: AppColor.colorAppDark,
                          cursorHeight: 32,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: v4Controller,
                          focusNode: node4,
                          onChanged: (text) {
                            setState(() {
                              if (text.length == 1) {
                                v4 = text;
                                FocusScope.of(context).requestFocus(node5);
                              } else {
                                FocusScope.of(context).requestFocus(node3);
                              }
                            });
                          },
                        )
                    ),
                    Container(
                        decoration: MainClass.conDecor(15, AppColor.colorApp, 1, Colors.white),
                        width: MainClass.devW(context, 7),
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(color: AppColor.colorAppDark, fontSize: 32, fontWeight: FontWeight.w400),
                          cursorColor: AppColor.colorAppDark,
                          cursorHeight: 32,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          controller: v5Controller,
                          focusNode: node5,
                          onChanged: (text) {
                            setState(() {
                              if (text.length == 1) {
                                v5 = text;
                                node5.unfocus();
                              }
                            });
                          },
                        )
                    ),
                  ],
                ),
                MainClass.bH(24),
                Btn(onPressed: (){
                  if(v1Controller.text.isEmpty || v2Controller.text.isEmpty || v3Controller.text.isEmpty || v4Controller.text.isEmpty || v5Controller.text.isEmpty){
                    MainClass.err(context, 'All fields are required');
                    return;
                  }

                  node1.unfocus();
                  node2.unfocus();
                  node3.unfocus();
                  node4.unfocus();
                  node5.unfocus();

                  MainClass.open(context, const VerifySuccess(chk: true));
                }, title: 'Enter'),
                MainClass.bH(12),
                if(!retry)
                Center(
                  child: MainClass.txtCus3('Resend in ($c)s', 14, AppColor.colorAppGray42),
                ),
                if(retry)
                InkWell(
                  onTap: () {
                    setState(() {
                      retry = false;
                      c = 30;
                      v1Controller.text = '';
                      v2Controller.text = '';
                      v3Controller.text = '';
                      v4Controller.text = '';
                      v5Controller.text = '';
                      v1 = '';
                      v2 = '';
                      v3 = '';
                      v4 = '';
                      v5 = '';
                      node1.unfocus();
                      node2.unfocus();
                      node3.unfocus();
                      node4.unfocus();
                      node5.unfocus();
                    });
                    MainClass.sus(context, 'OTP Resent');
                    startCount();
                  },
                  child: Center(
                    child: MainClass.txtCus3('Resend Now', 14, AppColor.colorAppGray42),
                  ),
                ),
                MainClass.bH(4),
              ],
            ),
          )
        ],
      ),
    );
  }

  startCount() {
    if(!retry) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (c > 0) {
            setState(() {
              c--;
            });
          } else {
            setState(() {
              retry = true;
            });
            timer.cancel();
          }
        });
      });
    }
  }

}
