import 'package:expedier/splash.dart';
import 'package:flutter/material.dart';

import 'classes/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expedier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.colorApp),
        useMaterial3: true,
        cardColor: Colors.white,
        canvasColor: Colors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        dialogTheme: const DialogTheme(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white
        ),
        popupMenuTheme: const PopupMenuThemeData(
            surfaceTintColor: Colors.white,
            color: Colors.white
        ),
      ),
      home: Splash(),
    );
  }

}
