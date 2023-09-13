import 'package:fast_trivia/main.dart';
import 'package:fast_trivia/view/global_components/dialog.dart';
import 'package:fast_trivia/view/screens/test/test_screen.dart';
import 'package:flutter/material.dart';

void changePageTo(TriviaPages page) {
  FastTrivia.pageController.animateToPage(
    page.index,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}

void changeToNextPage() {
  FastTrivia.pageController.nextPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}

void changeToPreviousPage(BuildContext context) async {
  final double? page = FastTrivia.pageController.page;

  if (page == TriviaPages.test.index) {
    final double? page = TestScreen.controller.page;
    if (page != 0) {
      TestScreen.controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    } else {
      bool doReturn = false;
      await showAlertDialog(
        context,
        title: "Quer mesmo voltar?",
        description: "Caso saia, o progresso do quiz será perdido.",
        yes: () => Navigator.pop(context),
        no: () {
          Navigator.pop(context);
          doReturn = true;
        },
      );
      if (doReturn) return;
    }
  } else if (page == TriviaPages.result.index) {
    FastTrivia.pageController.jumpToPage(
      TriviaPages.home.index,
    );
    return;
  }

  FastTrivia.pageController.previousPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );
}

double? getCurrentPage() {
  return FastTrivia.pageController.page;
}

enum TriviaPages {
  home,
  confirmation,
  test,
  result,
}
