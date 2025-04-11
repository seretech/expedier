import 'package:expedier/classes/app_color.dart';
import 'package:flutter/material.dart';

import '../classes/main_class.dart';

class Btn extends StatefulWidget {

  final Function() onPressed;
  final String title;
  final double? radius;
  final Color? textColor;
  final Color? btnColor;
  final Color? borderColor;
  final double? textSize;

  const Btn(
      {super.key,
        required this.onPressed,
        required this.title,
        this.radius,
        this.textColor,
        this.btnColor,
        this.borderColor,
        this.textSize
      });

  @override
  State<Btn> createState() => _State();

}

class _State extends State<Btn> {


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        splashFactory: NoSplash.splashFactory,
        backgroundColor: widget.btnColor ?? AppColor.colorApp,
        minimumSize: const Size.fromHeight(56),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: widget.borderColor ?? AppColor.colorApp),
          borderRadius: BorderRadius.circular(widget.radius ?? 16),
        ),
      ),
      child: MainClass.txtCus5(widget.title, widget.textSize ?? 16, widget.textColor ?? Colors.white),
    );
  }

}