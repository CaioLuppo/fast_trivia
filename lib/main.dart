library main;

import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/controller/database/dao.dart';
import 'package:fast_trivia/controller/util/system.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/model/store/review_store.dart';
import 'package:fast_trivia/model/store/trivia_appbar_store.dart';
import 'package:fast_trivia/view/global_components/trivia_app_bar.dart';
import 'package:fast_trivia/view/resources/themes.dart';
import 'package:fast_trivia/view/screens/confirmation/confirmation_screen.dart';
import 'package:fast_trivia/view/screens/home/home_screen.dart';
import 'package:fast_trivia/view/screens/result/result_screen.dart';
import 'package:fast_trivia/view/screens/review/review_screen.dart';
import 'package:fast_trivia/view/screens/test/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

part 'view/global_components/main_builder.dart';

void main() {
  runApp(const FastTrivia());
}

class FastTrivia extends StatelessWidget {
  const FastTrivia({super.key});
  static final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    updateSystemUi();
    return MaterialApp(
      theme: lightTheme,
      home: MultiProvider(
        providers: [
          Provider(create: (context) => TriviaAppBarStore()),
          Provider(create: (context) => QuizStore()),
          Provider(create: (context) => ReviewStore()),
        ],
        child: fastTriviaBuilder(pageController),
      ),
    );
  }
}
