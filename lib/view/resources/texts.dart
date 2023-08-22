import 'package:flutter/material.dart';

class PoetsenOne extends Text {
  PoetsenOne(String text, {required double fontSize, Color? color, super.key})
      : super(
          text,
          style: TextStyle(
            fontFamily: "PoetsenOne",
            color: color ?? Colors.black,
            fontSize: fontSize,
          ),
        );
}

class InriaSans extends Text {
  InriaSans(
    String text, {
    required double fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? alignment,
    super.key,
  }) : super(
          text,
          textAlign: alignment,
          style: TextStyle(
            color: color ?? Colors.black,
            fontFamily: "Inria Sans",
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        );
}
