import 'package:fast_trivia/main.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/view/screens/test/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void changePageTo(TriviaPages page) {
  FastTrivia.pageController.animateToPage(
    page.index,
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}

void changeToNextPage(PageController controller) {
  controller.nextPage(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}

void changeToPreviousPage(BuildContext context) {
  final double? page = FastTrivia.pageController.page;

  if (page == TriviaPages.home.index) {
  } else if (page == TriviaPages.test.index) {
    if (TestScreen.controller.page == 0) {
      Provider.of<QuizStore>(context, listen: false).clearAnswers();
    } else {
      TestScreen.controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }
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
}
