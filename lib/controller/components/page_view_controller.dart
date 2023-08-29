import 'package:fast_trivia/main.dart';
import 'package:flutter/material.dart';

void changePageTo(TriviaPages page) {
  FastTrivia.pageController.animateToPage(
    page.index,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}

void changeToPreviousPage() {
  FastTrivia.pageController.previousPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}

double? getCurrentPage() {
  return FastTrivia.pageController.page;
}

enum TriviaPages {
  home,
  confirmation,
  test,
}
