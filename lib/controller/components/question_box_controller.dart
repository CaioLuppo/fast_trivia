import 'package:fast_trivia/model/question.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/view/resources/texts.dart';
import 'package:fast_trivia/view/screens/review/review_screen.dart';
import 'package:flutter/material.dart';

Widget returnCorrectAnswerIfNeeded(
  Alternative correctAlternative,
  QuizStore quizStore,
  int questionIndex,
) {
  return quizStore.isCorrect(questionIndex)
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
        );
}
