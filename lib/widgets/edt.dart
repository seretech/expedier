import 'package:expedier/classes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../classes/main_class.dart';

class Edt extends StatefulWidget {

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FocusNode focusNode;
  final TextEditingController textController;
  final TextInputType? textInputType;
  final String? hint;
  final int? max;
  final double? elevation;
  final bool? auto;
  final bool? border;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormat;

  const Edt(
      {super.key,
        this.onChanged,
        this.onSubmitted,
        required this.focusNode,
        required this.textController,
        this.textInputType,
        this.hint,
        this.max,
        this.elevation,
        this.auto,
        this.border,
        this.borderColor,
        this.inputFormat
      });

  @override
  State<Edt> createState() => _State();
}

class _State extends State<Edt> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      controller: widget.textController,
      focusNode: widget.focusNode,
      keyboardType: widget.textInputType ?? TextInputType.text,
      maxLength: widget.max ?? 256,
      style: MainClass.txtStyle(),
      cursorColor: Colors.black,
      maxLines: 1,
      autocorrect: false,
      autofocus: widget.auto ?? false,
      enableSuggestions: true,
      inputFormatters: widget.inputFormat ?? [],
      onTapOutside: (v){
        widget.focusNode.unfocus();
      },
      decoration: InputDecoration(
        counterText: '',
        hintText: widget.hint ?? '',
        hintStyle: GoogleFonts.rubik(fontWeight: FontWeight.w300, fontSize: 14, color: AppColor.colorAppGray42.withValues(alpha: 0.5)),
        filled: true,
        fillColor: AppColor.colorApp.withValues(alpha: 0.03),
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
      ),
    );
  }
}