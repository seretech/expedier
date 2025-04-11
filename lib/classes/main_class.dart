import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_color.dart';

class MainClass {

  static bH(sz) {
    double a1 = sz.toDouble();
    return SizedBox(height: a1);
  }

  static bW(sz) {
    double a1 = sz.toDouble();
    return SizedBox(width: a1);
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }

  static bool isEmailValid(String s) => hasMatch(s,
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static txtW4(txt, sz) {
    double a1 = sz.toDouble();
    return Text(txt,
        style: GoogleFonts.rubik(color: Colors.white, fontSize: a1, fontWeight: FontWeight.w400));
  }

  static txtW5(txt, sz) {
    double a1 = sz.toDouble();
    return Text(txt,
        style: GoogleFonts.rubik(color: Colors.white, fontSize: a1, fontWeight: FontWeight.w500));
  }

  static txtB4(txt, sz) {
    double a1 = sz.toDouble();
    return Text(txt,
        style: GoogleFonts.rubik(color: Colors.black, fontSize: a1, fontWeight: FontWeight.w400));
  }

  static txtCus3(txt, sz, cl) {
    double a1 = sz.toDouble();
    return Text(txt,
        style: GoogleFonts.rubik(color: cl, fontSize: a1, fontWeight: FontWeight.w300));
  }

  static txtCus4(txt, sz, cl) {
    double a1 = sz.toDouble();
    return Text(txt,
        style: GoogleFonts.rubik(color: cl, fontSize: a1, fontWeight: FontWeight.w400));
  }

  static txtCus5(txt, sz, cl) {
    double a1 = sz.toDouble();
    return Text(txt,
        style: GoogleFonts.rubik(color: cl, fontSize: a1, fontWeight: FontWeight.w500));
  }

  static txtCus6(txt, sz, cl) {
    double a1 = sz.toDouble();
    return Text(txt,
        style: GoogleFonts.rubik(color: cl, fontSize: a1, fontWeight: FontWeight.w600));
  }

  static txtStyle() {
    return GoogleFonts.rubik(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400);
  }

  static devH(ctx, sz) {
    double a1 = sz.toDouble();
    return MediaQuery.of(ctx).size.height / a1;
  }

  static devW(ctx, sz) {
    double a1 = sz.toDouble();
    return MediaQuery.of(ctx).size.width / a1;
  }

  static conDecor(r, c, b, col) {
    double r1 = r.toDouble();
    double b1 = b.toDouble();
    return BoxDecoration(
      color: col,
      borderRadius: BorderRadius.circular(r1),
      border: Border.all(
        color: c,
        width: b1,
      ),
    );
  }

  static conDeco(r, col) {
    double r1 = r.toDouble();
    return BoxDecoration(
      color: col,
      borderRadius: BorderRadius.circular(r1),
    );
  }

  static col(c) {
    if (c == '') {
      c = AppColor.colorApp;
    } else if (c == 'wh') {
      c = Colors.white;
    } else if (c == 'bl') {
      c = Colors.black;
    }
    return ColorFilter.mode(c, BlendMode.srcIn);
  }

  static padA(i) {
    double a = i.toDouble();
    return EdgeInsets.all(a);
  }

  static padS(t, l) {
    double ver = t.toDouble();
    double hor = l.toDouble();
    return EdgeInsets.only(top: ver, bottom: ver, left: hor, right: hor);
  }

  static open(ctx, p) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) => p),
    );
  }

  static customAppBarWh() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: AppBar(
        elevation: 0,
        systemOverlayStyle: Platform.isIOS
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      ),
    );
  }

  static customAppBarDk() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(0),
      child: AppBar(
        elevation: 0,
        systemOverlayStyle: Platform.isIOS
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle(
            systemNavigationBarColor: AppColor.colorAppDarker,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarColor: AppColor.colorAppDarker,
            statusBarIconBrightness: Brightness.light),
      ),
    );
  }

  static err(ctx, sms) {
    AnimatedSnackBar(
      builder: ((context) {
        return Container(
          decoration: conDecor(4, Colors.red, 0, Colors.red),
          padding: padS(4, 8),
          child: Wrap(
            children: [
              Text(sms,
                  style: GoogleFonts.rubik(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),
        );
      }),
      duration: const Duration(seconds: 3),
    ).show(ctx);
  }

  static sus(ctx, sms) {
    AnimatedSnackBar(
      builder: ((context) {
        return Container(
          decoration: conDecor(4, Colors.green, 0, Colors.green),
          padding: padS(4, 8),
          child: Wrap(
            children: [
              Text(sms,
                  style: GoogleFonts.rubik(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),
        );
      }),
      duration: const Duration(seconds: 3),
    ).show(ctx);
  }

  static heading(s, ctx, chk) {
    return Container(
      width: double.infinity,
      padding: MainClass.padA(8),
      child: InkWell(
        onTap: () => Navigator.pop(ctx),
        child: Row(
          children: [
            Container(
                padding: padA(12),
                decoration: conDecor(8, AppColor.colorApp, 1, Colors.white),
                child: SvgPicture.asset('assets/extras/ar_back.svg', width: 16, height: 16)),
            bW(12),
            if(chk)
              Expanded(child: Center(child: txtCus4(s, 20, AppColor.colorAppDark2))),
            if(!chk)
              Expanded(child: txtCus4(s, 20, AppColor.colorAppDark2)),
            bW(28),
          ],
        ),
      )
    );
  }

  static typeCard(s, t, chk) {
    return Container(
      decoration: conDecor(15, AppColor.colorApp, 1, chk ? AppColor.colorApp : Colors.white),
      width: double.infinity,
      padding: padS(12, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          txtCus4(s, 14, chk ? Colors.white :AppColor.colorAppGray21),
          txtCus3(t, 14, chk ? Colors.white :AppColor.colorAppGray42.withValues(alpha: 0.7)),
        ],
      ),
    );
  }

  static quickCard(s, t, ctx) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MainClass.devW(ctx, 6),
          height: MainClass.devW(ctx, 6),
          padding: padA(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: AppColor.colorApp,
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: Image.asset(t, width: 16, height: 16),
          ),
        ),
        MainClass.bH(8),
        MainClass.txtCus4(s, 14, AppColor.colorAppDark),
      ],
    );
  }

  static accountCard(s, t, ic, ctx) {
    return Container(
      width: MainClass.devW(ctx, 2),
      padding: MainClass.padA(16),
      decoration: MainClass.conDeco(15, Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset(ic, width: 28, height: 28),
              Expanded(child: Container()),
              MainClass.bW(12),
              Container(
                padding: MainClass.padA(12),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.colorApp.withValues(alpha: 0.08),
                ),
                child: SvgPicture.asset('assets/extras/add.svg'),
              ),
            ],
          ),
          MainClass.bH(8),
          MainClass.txtCus4(s, 20, AppColor.colorAppGray21),
          MainClass.bH(4),
          Text(
            t,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w300,
              color: AppColor.colorAppGray42,
            ),
          ),
          MainClass.bH(8),
        ],
      ),
    );
  }

  static onboardCard(s, ic, t) {
    return AnimatedRotation(
      turns: t,
      duration: Duration(milliseconds: 300),
      child: Material(
        elevation: 2,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: conDeco(15, AppColor.colorAppGray),
          width: double.infinity,
          padding: padA(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(ic, height: 28, width: 28),
                  bW(12),
                  Text(s, style: GoogleFonts.inter(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: GoogleFonts.inter(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
                  children: <InlineSpan>[
                    TextSpan(text: '76,36'),
                    WidgetSpan(
                      child: SizedBox(width: 2),
                    ),
                    WidgetSpan(
                      child: SvgPicture.asset('assets/extras/ar_down1.svg', width: 16, height: 16),
                    ),

                  ],
                ),
              ),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: GoogleFonts.inter(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
                  children: <InlineSpan>[
                    TextSpan(text: '76,36'),
                    WidgetSpan(
                      child: SizedBox(width: 2),
                    ),
                    WidgetSpan(
                      child: SvgPicture.asset('assets/extras/ar_up.svg', width: 16, height: 16),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
