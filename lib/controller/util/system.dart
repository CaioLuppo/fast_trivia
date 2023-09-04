import 'dart:io';

import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/model/store/trivia_appbar_store.dart';
import 'package:fast_trivia/view/resources/texts.dart';
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
    TriviaAppBarStore store) {
  if (pageController.page != TriviaPages.home.index) {
    changeToPreviousPage(context);
  } else {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Center(child: PoetsenOne("Deseja sair?", fontSize: 19)),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              actions: [
                TextButton(
                  onPressed: () => exit(0),
                  child: InriaSans(
                    "SIM",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: TriviaColors.blue,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: InriaSans(
                    "NÃO",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: TriviaColors.blue,
                  ),
                ),
              ],
            ));
  }
  return Future.value(false);
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
