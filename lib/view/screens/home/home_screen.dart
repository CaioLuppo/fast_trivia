library home;

import 'package:fast_trivia/controller/components/home_imports.dart';
import 'package:fast_trivia/controller/http/dao/quiz_dao.dart';
import 'package:fast_trivia/controller/http/dao/quiz_dao.mocks.dart';
import 'package:fast_trivia/controller/store/bullet_store.dart';
import 'package:fast_trivia/controller/store/confirmation_store.dart';
import 'package:fast_trivia/controller/store/trivia_appbar_store.dart';
import 'package:fast_trivia/main.dart';
import 'package:fast_trivia/model/quiz.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

part 'components/bullets.dart';
part 'components/quiz_card.dart';
part 'components/quiz_slider.dart';
part 'sessions/todo_quizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QuizDao mock = MockQuizDao();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: QuizesSession(
                title: "Testes disponíveis:",
                emptyMessage: "Não há nenhum curso restante!",
                futureFunction: mock.getQuestionnaries,
              ),
            ),
            Observer(
              builder: (_) => QuizesSession(
                title: "Já realizados",
                futureFunction: () => Future.value([]),
                emptyMessage:
                    "Seu questinário aparecerá aqui quando terminar! 😉",
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: InriaSans(
                "By: Caio Luppo",
                fontSize: 16,
                color: TriviaColors.subtitles,
              ),
            )
          ],
        ),
      ),
    );
  }
}
