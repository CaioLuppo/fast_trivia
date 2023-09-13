import 'dart:io';

import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/model/store/trivia_appbar_store.dart';
import 'package:fast_trivia/view/global_components/dialog.dart';
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

Future<bool> onWillPop(BuildContext context, PageController pageController,
    TriviaAppBarStore store) async {
  if (pageController.page != TriviaPages.home.index) {
    changeToPreviousPage(context);
    return Future.value(false);
  } else {
    await showAlertDialog(
      context,
      title: "Deseja sair?",
      yes: () => exit(0),
      no: () => Navigator.of(context).pop(),
    );
    return Future.value(false);
  }
}

void lockOrientation(bool lock) async {
  if (lock) {
    return await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
  }
  return await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}
