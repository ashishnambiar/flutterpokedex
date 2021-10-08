import 'package:flutter/material.dart';

class ChangeTheme extends ChangeNotifier {
  ThemeData _theme = ThemeData();

  ThemeData get newTheme => _theme;

  getTheme(String area) {
    Color primary = Color(0xffffffff);
    Color background = Color(0xffffffff);
    Color buttonText = Color(0xffffffff);
    switch (area) {
      case "cave":
        primary = Color(0xffb30027);
        background = Color(0xffb33300);
        buttonText = Color(0xffb38c00);

        break;
      case "forest":
        primary = Color(0xff6aa60f);
        background = Color(0xff90ca25);
        buttonText = Color(0xff4c0fa6);
        break;
      case "grassland":
        primary = Color(0xff1dd23d);
        background = Color(0xff92e16f);
        buttonText = Color(0xff77008b);
        break;
      case "mountain":
        primary = Color(0xff81bcb3);
        background = Color(0xffc7e1d0);
        buttonText = Color(0xff42006f);
        break;
      case "rare":
        primary = Color(0xff8204c5);
        background = Color(0xff8f0041);
        buttonText = Color(0xffc58204);
        break;
      case "rough-terrain":
        primary = Color(0xff69573c);
        background = Color(0xff9e9e52);
        buttonText = Color(0xff3c4e69);
        break;
      case "sea":
        primary = Color(0xff006a94);
        background = Color(0xff384955);
        buttonText = Color(0xff9cadbc);
        break;
      case "urban":
        primary = Color(0xff7196A1);
        background = Color(0xffD9D6BF);
        buttonText = Color(0xff3D632F);
        break;
      case "waters-edge":
        primary = Color(0xff7196A1);
        background = Color(0xffD9D6BF);
        buttonText = Color(0xff3D632F);
        break;
      default:
        primary = ThemeData.dark().primaryColor;
        background = ThemeData.dark().scaffoldBackgroundColor;
        buttonText = ThemeData.dark().colorScheme.background;
    }
    _theme = ThemeData.dark().copyWith(
      primaryColor: primary,
      scaffoldBackgroundColor: background,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(buttonText),
        ),
      ),
    );
    notifyListeners();
  }
}
