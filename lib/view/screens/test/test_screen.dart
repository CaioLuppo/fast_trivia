library test;

import 'package:fast_trivia/controller/components/alternatives_controller.dart';
import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/controller/store/alternative_store.dart';
import 'package:fast_trivia/controller/store/quiz_store.dart';
import 'package:fast_trivia/model/question.dart';
import 'package:fast_trivia/view/global_components/button.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

part 'components/alternatives_session.dart';
part 'components/question_header.dart';
part 'components/alternative_widget.dart';

class TestScreen extends StatelessWidget {
  final Question question;

  const TestScreen(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    final AlternativeStore store = AlternativeStore();
    final quizStore = Provider.of<QuizStore>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionHeader(question),
          AlternativesSession(store, question),
          const Spacer(),
          Observer(
            builder: (_) {
              final bool isLast = question.id == quizStore.questionPages.length;
              return ActionButton(
                isLast ? "Finalizar teste" : "Próxima questão",
                () => changeToNextPage(),
                color: isLast ? TriviaColors.red : TriviaColors.green,
                disabled: store.selectedAlternative == null,
              );
            },
          )
        ],
      ),
    );
  }
}
