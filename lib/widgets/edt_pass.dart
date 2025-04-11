import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/app_color.dart';
import '../classes/main_class.dart';

class EdtPass extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final Function()? onPress;
  final FocusNode focusNode;
  final TextEditingController textController;
  final TextInputType? textInputType;
  final String? hint;
  final int? max;
  final double? elevation;
  final bool chk;
  final bool? auto;
  final Color? borderColor;

  const EdtPass(
      {super.key,
        this.onChanged,
        required this.onPress,
        required this.focusNode,
        required this.textController,
        required this.chk,
        this.textInputType,
        this.hint,
        this.max,
        this.elevation,
        this.auto,
        this.borderColor
      });

  @override
  State<EdtPass> createState() => _State();
}

class _State extends State<EdtPass> {


  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget.textController,
      focusNode: widget.focusNode,
      keyboardType: widget.textInputType ?? TextInputType.text,
      maxLength: widget.max ?? 256,
      style: MainClass.txtStyle(),
      cursorColor: Colors.black,
      maxLines: 1,
      autocorrect: false,
      autofocus: widget.auto ?? false,
      enableSuggestions: false,
      obscureText: widget.chk,
      obscuringCharacter: '*',
      onTapOutside: (v){
        widget.focusNode.unfocus();
      },
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: AppColor.colorApp.withValues(alpha: 0.03),
        hintText: widget.hint ?? '',
        hintStyle: GoogleFonts.rubik(fontWeight: FontWeight.w300, fontSize: 14, color: AppColor.colorAppGray42.withValues(alpha: 0.5)),
        isDense: true,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor ?? AppColor.colorApp),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: widget.borderColor ?? AppColor.colorApp)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: widget.borderColor ?? AppColor.colorApp)),
        suffixIcon: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 4),
            icon: widget.chk
                ? Image.asset('assets/extras/eye_open.png', width: 16, height: 16, color: AppColor.colorApp)
                : Icon(Icons.visibility_rounded,
                color: AppColor.colorApp, size: 16,),
            onPressed: widget.onPress
        ),
      ),
    );
  }
}