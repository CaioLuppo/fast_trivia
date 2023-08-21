library home;

import 'package:fast_trivia/view/global_components/trivia_app_bar.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part 'sessions/todo_quizes.dart';
part 'components/quiz_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TriviaAppBar(),
      body: const SafeArea(
        child: Column(
          children: [
            TodoQuizes(),
          ],
        ),
      ),
    );
  }
}
