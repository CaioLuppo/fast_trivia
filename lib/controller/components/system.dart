import 'dart:io';

import 'package:fast_trivia/controller/store/trivia_appbar_store.dart';
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
  if (pageController.page != 0) {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
    store.updateProperties(
      showBackButton: false,
      elevate: false,
    );
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
