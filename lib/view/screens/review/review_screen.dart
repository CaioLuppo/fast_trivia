library review;

import 'package:fast_trivia/controller/components/alternatives_controller.dart';
import 'package:fast_trivia/controller/components/question_box_controller.dart';
import 'package:fast_trivia/model/question.dart';
import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:fast_trivia/model/store/review_store.dart';
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
        ? SingleChildScrollView(
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
                  getAnswersList(quizStore),
            ),
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
