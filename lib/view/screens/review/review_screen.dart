library review;

import 'package:fast_trivia/controller/components/alternatives_controller.dart';
import 'package:fast_trivia/controller/components/page_view_controller.dart';
import 'package:fast_trivia/controller/components/question_box_controller.dart';
import 'package:fast_trivia/model/question.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/model/store/review_store.dart';
import 'package:fast_trivia/view/global_components/button.dart';
import 'package:fast_trivia/view/global_components/dialog.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

part 'components/question_box.dart';
part 'components/review_answer_box.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ReviewStore reviewStore = Provider.of<ReviewStore>(context);
    final QuizStore quizStore = Provider.of<QuizStore>(context);

    return reviewStore.reviewing
        ? Stack(
            children: [
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: Column(
                  children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Column(
                            children: [
                              PoetsenOne(
                                "${quizStore.quiz!.title}:",
                                fontSize: 33,
                              ),
                              InriaSans(
                                "${quizStore.correctAnswers}/"
                                "${quizStore.quiz!.questions.length} questões acertadas",
                                fontSize: 19,
                                color: TriviaColors.subtitles,
                                fontWeight: FontWeight.w700,
                              )
                            ],
                          ),
                        ),
                      ] +
                      getAnswersList(quizStore) +
                      <Widget>[
                        const SizedBox(
                          height: 54 * 2 /* Botões */ + 24 * 2 /* Padding */,
                        )
                      ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: ActionButton(
                        "Refazer teste",
                        () async {
                          bool canMove = true;
                          await showAlertDialog(
                            context,
                            title: "Refazer o teste?",
                            description:
                                "Se refazer o teste, o progresso anterior será"
                                " substituido pelo novo!\n\nCaso se arrependa,"
                                " basta voltar para tela inicial na tela de"
                                " confirmação.",
                            no: () => Navigator.pop(context),
                            yes: () {
                              quizStore.setDoingTest(true);
                              reviewStore.setReviewing(false);
                              Navigator.pop(context);
                              canMove = false;
                            },
                          );
                          if (context.mounted && !canMove) {
                            changePageTo(TriviaPages.confirmation);
                          }
                        },
                        color: TriviaColors.yellow,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      child: ActionButton(
                        "Voltar para tela inicial",
                        () => changePageTo(TriviaPages.home),
                        color: TriviaColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Container();
  }
}

List<Widget> getAnswersList(QuizStore quizStore) {
  return List.generate(
    quizStore.quiz!.questions.length,
    (index) {
      return QuestionBox(quizStore: quizStore, index: index);
    },
  );
}
