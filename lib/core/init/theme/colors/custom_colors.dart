import 'package:flutter/material.dart';

class CustomColors {
  static final CustomColors _instance = CustomColors._init();
  static CustomColors get instance => _instance;

  CustomColors._init();

  Color vaniliaBackgroundColor = const Color(0xFFfedadc);
  Color vaniliaImageColor = const Color(0xFFfd5590);

  Color neopolitianBackgroundColor = const Color(0xFFffefcb);
  Color neopolitionImageColor = const Color(0xFFf7d478);

  Color cookieBackgroundColor = const Color(0xFFd4dfff);
  Color cookieImageColor = const Color(0xFFb1c0f7);

  Color topItemColor1 = const Color(0xFFdef4ff);
  Color topItemColor2 = const Color(0xFFfee5e8);

  LinearGradient buttonLinearGradientColor = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFff7cab),
      Color(0xFFf34282),
    ],
  );
}
