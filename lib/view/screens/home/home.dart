library home;

import 'package:fast_trivia/controller/components/home_imports.dart';
import 'package:fast_trivia/controller/http/dao/quiz_dao.dart';
import 'package:fast_trivia/controller/http/dao/quiz_dao.mocks.dart';
import 'package:fast_trivia/controller/store/bullet_store.dart';
import 'package:fast_trivia/model/quiz.dart';
import 'package:fast_trivia/view/global_components/trivia_app_bar.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

part 'components/bullets.dart';
part 'components/quiz_card.dart';
part 'components/quiz_slider.dart';
part 'sessions/todo_quizes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizDao mock = MockQuizDao();

    return Scaffold(
      appBar: TriviaAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            QuizesSession(
              title: "Testes disponíveis:",
              emptyMessage: "Não há nenhum curso restante!",
              futureFunction: mock.getQuestionnaries,
            ),
          ],
        ),
      ),
    );
  }
}
