import 'package:fast_trivia/main.dart';
import 'package:fast_trivia/view/screens/test/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:provider/provider.dart';

void nextQuestion(BuildContext context, {bool end = false}) {
  if (!end) {
    TestScreen.controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  } else {
    FastTrivia.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    Provider.of<QuizStore>(context, listen: false).updateCurrentIndex(0);
  }
}
