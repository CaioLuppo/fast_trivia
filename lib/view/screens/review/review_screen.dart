import 'package:fast_trivia/controller/components/alternatives_controller.dart';
import 'package:fast_trivia/model/question.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/model/store/review_store.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/resources/trivia_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ReviewStore reviewStore = Provider.of<ReviewStore>(context);
    final QuizStore quizStore = Provider.of<QuizStore>(context);
    return reviewStore.reviewing
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        16,
                        16,
                        0,
                      ),
                      child: PoetsenOne(
                        "${quizStore.quiz!.title}:",
                        fontSize: 33,
                      ),
                    ),
                  ] +
                  List.generate(
                    quizStore.quiz!.questions.length,
                    (index) {
                      return QuestionBox(quizStore: quizStore, index: index);
                    },
                  ),
            ),
          )
        : Container();
  }
}

class QuestionBox extends StatelessWidget {
  final QuizStore quizStore;
  final int index;

  const QuestionBox({super.key, required this.quizStore, required this.index});

  @override
  Widget build(BuildContext context) {
    final Color color = quizStore.isCorrect(index) ? Colors.green : Colors.red;
    final Question question = quizStore.quiz!.questions[index];
    final int selectedAlternative =
        quizStore.answers[quizStore.quiz!.id]![index + 1]!;
    final Alternative correctAlternative =
        question.alternatives[question.answer - 1];

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: TriviaColors.lightGreyWidgets,
        border: Border.all(
          color: color,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoetsenOne(
                  "Pergunta:",
                  fontSize: 19,
                ),
                PoetsenOne(
                  "nº${index + 1}",
                  fontSize: 19,
                  color: TriviaColors.subtitles,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 8.0,
              ),
              child: InriaSans(
                question.question,
                fontSize: 16,
              ),
            ),
            PoetsenOne(
              "Alternativa escolhida:",
              fontSize: 19,
            ),
            ReviewAnswerBox(
              selectedAlternative,
              quizStore.quiz!.questions[index]
                  .alternatives[selectedAlternative - 1].title,
              correct: quizStore.isCorrect(index),
            ),
            quizStore.isCorrect(index)
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PoetsenOne(
                          "Resposta correta: ",
                          fontSize: 19,
                        ),
                        ReviewAnswerBox(
                          correctAlternative.id,
                          correctAlternative.title,
                          correct: true,
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class ReviewAnswerBox extends StatelessWidget {
  final bool correct;
  final int index;
  final String question;
  const ReviewAnswerBox(this.index, this.question,
      {required this.correct, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: correct ? TriviaColors.green10 : TriviaColors.red10,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SvgPicture.asset(
              correct ? "assets/correct.svg" : "assets/wrong.svg",
            ),
            const SizedBox(
              width: 12,
            ),
            InriaSans(
              "${getAlternativeLetter(index)}"
              " - $question",
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
