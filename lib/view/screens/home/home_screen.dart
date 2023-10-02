library home;

import 'package:fast_trivia/controller/components/home_imports.dart';
import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/controller/http/dao/quiz_dao.dart';
import 'package:fast_trivia/controller/http/dao/quiz_dao.mocks.dart';
import 'package:fast_trivia/controller/util/system.dart';
import 'package:fast_trivia/model/quiz.dart';
import 'package:fast_trivia/model/store/bullet_store.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/model/store/review_store.dart';
import 'package:fast_trivia/model/store/trivia_appbar_store.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

part 'components/bullets.dart';
part 'components/quiz_card.dart';
part 'components/quiz_slider.dart';
part 'sessions/quizzes_session.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    lockOrientation(true);
    final QuizDao mock = MockQuizDao();
    final QuizStore quizStore = Provider.of<QuizStore>(context);

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: QuizzesSession(
              title: "Testes disponíveis:",
              emptyMessage: "Não há nenhum quiz restante! 😎",
              futureFunction: () async {
                final quizzes = await mock.getQuestionnaries();
                final List<Quiz> returnList = [];
                for (Quiz quiz in quizzes) {
                  if (!quizStore.answers.containsKey(quiz.id)) {
                    returnList.add(quiz);
                  }
                }
                return Future.value(returnList);
              },
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Observer(
            builder: (_) => QuizzesSession(
              title: "Já realizados",
              futureFunction: () {
                List<Quiz> quizzes = [];
                for (Quiz quiz in QuizDao.quizzes) {
                  if (quizStore.answers.containsKey(quiz.id)) {
                    quizzes.add(quiz);
                  }
                }
                return Future.value(quizzes);
              },
              emptyMessage:
                  "Seu questinário aparecerá aqui quando terminar! 😉",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: InriaSans(
            "By: Caio Luppo",
            fontSize: 16,
            color: TriviaColors.subtitles,
          ),
        ),
      ],
    );
  }
}
