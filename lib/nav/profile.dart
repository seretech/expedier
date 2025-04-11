import 'package:flutter/material.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _State();
}

class _State extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MainClass.txtCus5('Profile', 20, AppColor.colorApp),
      ),
    );
  }

}
