import 'package:flutter/material.dart';

// Colors
const PrimaryColor = Colors.black;
const BgLightColor = Color.fromRGBO(250, 250, 250, 1.0);
const TextColorBlack = Color.fromRGBO(68, 68, 68, 1.0);
const TextColorBlack66 = Color.fromRGBO(102, 102, 102, 1.0);
const TextColorBlack44 = Color(0xFF444444);
const TextColorGray = Color.fromRGBO(153, 153, 153, 1.0);
const BlakOpacity50 = Color(0x88000000);
const WitheOpacity50 = Color(0x88FFFFFF);
const BlueOpacit80 = Color(0xa55689EC);

// Typography
const TitleWhit22 = TextStyle(color: Colors.white, fontSize: 22);
const TitleBlack22 = TextStyle(color: TextColorBlack44, fontSize: 22);
const SubtitleGray = TextStyle(color: TextColorGray, fontSize: 16);
const SubtitleWithe = TextStyle(color: Colors.white, fontSize: 16);

ThemeData appTheme() {
  return ThemeData(
    primaryColor: PrimaryColor,
    scaffoldBackgroundColor: BgLightColor,
    appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white)),
  );
}
