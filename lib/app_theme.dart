import 'package:flutter/material.dart';
import 'package:speakeasy/const.dart';

ThemeData appTheme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
    color: (Color(0xff000050)),
    centerTitle: true,
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold, color: ksecndaryColor, fontSize: 20),
  ));
}
