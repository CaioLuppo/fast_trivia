import 'package:fast_trivia/controller/store/trivia_appbar_store.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void updateSystemUi() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: TriviaColors.scaffoldBg,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

Future<bool> onWillPop(PageController pageController, TriviaAppBarStore store) {
  pageController.previousPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
  store.updateProperties(
    showBackButton: false,
    elevate: false,
  );
  return Future.value(false);
}
