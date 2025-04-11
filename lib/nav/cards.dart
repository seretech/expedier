import 'package:expedier/classes/app_color.dart';
import 'package:flutter/material.dart';

import '../classes/main_class.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _State();
}

class _State extends State<Cards> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MainClass.txtCus5('Cards', 20, AppColor.colorApp),
      ),
    );
  }

}

