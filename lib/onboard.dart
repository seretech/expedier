import 'package:expedier/auth/sign_in.dart';
import 'package:expedier/auth/sign_up.dart';
import 'package:expedier/classes/app_color.dart';
import 'package:expedier/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:move_to_background/move_to_background.dart';

import '../classes/main_class.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _State();
}

class _State extends State<Onboard> {

  double currentPage = 0;

  String title = 'Experience effortless currency exchange and fast Transaction',
      sub = 'Seamlessly convert currencies at the best rates with quick and secure transactions';

  double indicator = 0, turn1 = 0, turn2 = 0, turn3 = 0;

  PageController pageController = PageController(initialPage: 0);

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
            Expanded(
              child: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (v) {
                      setState(() {
                        if (v == 0) {
                          title = 'Experience effortless currency exchange and fast Transaction';
                          sub = 'Seamlessly convert currencies at the best rates with quick and secure transactions';
                          indicator = 0;
                          turn1 = 0;
                          turn2 = 0;
                          turn3 = 0;
                        } else if (v == 1) {
                          title = 'Card data security';
                          sub = 'Experience peace of mind with our Secured and Trusted banking app. ';
                          indicator = MainClass.devW(context, 4) / 3;
                          turn1 = 0;
                          turn2 = 0;
                          turn3 = 0;
                        } else if (v == 2) {
                          title = 'Exchange Money';
                          sub = 'Enjoy excellent exchange rates for various currencies.';
                          indicator = MainClass.devW(context, 4) / 1.6;
                          turn1 -= 1 / 56;
                          turn2 += 1 / 56;
                          turn3 -= 1 / 56;
                        }
                        currentPage = pageController.page!;
                      });
                    },
                    children: [
                      Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset('assets/onboard/1.png', height: MainClass.devW(context, 2), fit: BoxFit.cover),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.white],
                                stops: [0.78, 1],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset('assets/onboard/2.png', height: MainClass.devW(context, 2), fit: BoxFit.cover),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.white],
                                stops: [0.78, 1],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: MainClass.padS(12, 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MainClass.onboardCard('CAD', 'assets/extras/ca.png', turn1),
                            MainClass.bH(24),
                            MainClass.onboardCard('NGN', 'assets/extras/ng.png', turn2),
                            MainClass.bH(24),
                            MainClass.onboardCard('USD', 'assets/extras/us.png', turn3),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () => MainClass.open(context, SignIn()),
                        child: Padding(
                          padding: MainClass.padS(8, 16),
                          child: MainClass.txtCus4('Skip >>', 14, AppColor.colorAppDark),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MainClass.bH(16),
            Padding(
              padding: MainClass.padS(12, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(color: AppColor.colorAppGray21, fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  MainClass.bH(12),
                  Text(
                    sub,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(color: AppColor.colorAppGray42, fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  MainClass.bH(12),
                ],
              ),
            ),
            MainClass.bH(24),
            Padding(
              padding: MainClass.padS(8, 24),
              child: Stack(
                children: [
                  Container(
                    decoration: MainClass.conDeco(40, AppColor.colorAppLight3),
                    width: MainClass.devW(context, 4),
                    height: 6,
                  ),
                  AnimatedPositioned(
                    left: indicator,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      decoration: MainClass.conDeco(40, AppColor.colorApp),
                      width: MainClass.devW(context, 11),
                      height: 6,
                    ),
                  ),
                ],
              ),
            ),
            MainClass.bH(24),
            if (currentPage < 1)
              Padding(
                padding: MainClass.padA(16),
                child: Btn(
                  onPressed: () {
                    setState(() {
                      pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
                      currentPage = pageController.page!;
                    });
                  },
                  title: 'Next',
                ),
              ),
            if (currentPage > 1)
              Padding(
                padding: MainClass.padA(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Btn(
                        onPressed: () => MainClass.open(context, SignIn()),
                        btnColor: Colors.white,
                        textColor: AppColor.colorApp,
                        title: 'Log In',
                      ),
                    ),
                    MainClass.bW(12),
                    Expanded(child: Btn(onPressed: () => MainClass.open(context, SignUp()), title: 'Sign Up')),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
