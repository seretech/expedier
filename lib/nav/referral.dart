import 'package:flutter/material.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';

class Referral extends StatefulWidget {
  const Referral({super.key});

  @override
  State<Referral> createState() => _State();
}

class _State extends State<Referral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MainClass.txtCus5('Referral', 20, AppColor.colorApp),
      ),
    );
  }
}
