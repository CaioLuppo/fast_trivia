library test;

import 'package:fast_trivia/controller/components/alternatives_controller.dart';
import 'package:fast_trivia/model/question.dart';
import 'package:fast_trivia/model/store/alternative_store.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/view/global_components/button.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:fast_trivia/controller/components/test_controller.dart';

part 'components/alternative_widget.dart';
part 'components/alternatives_session.dart';
part 'components/question_header.dart';
part 'components/question_page.dart';

class TestScreen extends StatelessWidget {
  static final PageController controller = PageController();

  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizStore = Provider.of<QuizStore>(context, listen: false);
    return quizStore.doingTest
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) => quizStore.updateCurrentIndex(index),
                  children: List.generate(
                    quizStore.quiz!.questions.length,
                    (index) {
                      final AlternativeStore store = AlternativeStore();
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 24,
                        ),
                        child: QuestionPage(
                            quizStore.quiz!.questions[index], store),
                      );
                    },
                  ),
                ),
              ),
              Observer(
                builder: (_) {
                  if (!quizStore.answers.containsKey(quizStore.quiz!.id)) {
                    return Container();
                  }

                  final bool isLast = quizStore.currentQuestionIndex + 1 ==
                      quizStore.quiz!.questions.length;
                  final bool isSelected =
                      quizStore.answers[quizStore.quiz!.id]!.containsKey(
                    quizStore.currentQuestionIndex + 1,
                  );
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 24.0,
                    ),
                    child: ActionButton(
                      isLast ? "Finalizar teste" : "Próxima questão",
                      () => isSelected
                          ? nextQuestion(
                              context,
                              quizStore.quiz!.id,
                              end: isLast,
                            )
                          : null,
                      color: isLast ? TriviaColors.red : TriviaColors.green,
                      disabled: !isSelected,
                    ),
                  );
                },
              )
            ],
          )
        : Container();
  }
}
