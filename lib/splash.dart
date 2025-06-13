import 'package:expedier/classes/app_color.dart';
import 'package:expedier/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gif_view/gif_view.dart';

import 'classes/main_class.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _State();
}

class _State extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
          color: AppColor.colorApp,
          child: GifView.asset(
            'assets/onboard/splash.gif',
            frameRate: 10,
            loop: false,
            onFinish: (){
              MainClass.open(context, const Onboard());
            },
          ),

        ),
      ),
    );
  }
}
