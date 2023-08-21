import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.grey[50],
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  ),
  cardColor: TriviaColors.cardBackground
);
