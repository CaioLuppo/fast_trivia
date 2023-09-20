import 'package:fast_trivia/main.dart';
import 'package:fast_trivia/view/global_components/dialog.dart';
import 'package:fast_trivia/view/screens/test/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:provider/provider.dart';

Future<void> nextQuestion(BuildContext context, {bool end = false}) async {
  if (!end) {
    TestScreen.controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  } else {
    bool mustReturn = false;
    await showAlertDialog(
      context,
      title: "Acabou mesmo?",
      description: "Lembre-se de revisar antes de prosseguir. 😉",
      yes: () {
        Navigator.pop(context);
      },
      no: () {
        mustReturn = true;
        Navigator.pop(context);
      },
    );
    if (mustReturn) return Future.value();

    FastTrivia.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    if (context.mounted) {
      Provider.of<QuizStore>(context, listen: false).updateCurrentIndex(0);
    }
  }
  return Future.value();
}
