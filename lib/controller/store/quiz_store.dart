import 'package:fast_trivia/model/question.dart';
import 'package:fast_trivia/view/screens/confirmation/confirmation_screen.dart';
import 'package:fast_trivia/view/screens/home/home_screen.dart';
import 'package:fast_trivia/view/screens/test/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:fast_trivia/model/quiz.dart';

part 'quiz_store.g.dart';

// ignore: library_private_types_in_public_api
class QuizStore = _QuizStore with _$QuizStore;

abstract class _QuizStore with Store {
  @observable
  Quiz? quiz;

  @observable
  ObservableList<TestScreen> questionPages = ObservableList<TestScreen>();

  @computed
  List<Widget> get pages =>
      const [
        HomeScreen(),
        ConfirmationScreen(),
      ] +
      questionPages;

  @action
  void updateConfirmationScreen(Quiz quiz) {
    this.quiz = quiz;
  }

  @action
  void updateQuestionsScreen() {
    for (Question question in quiz!.questions) {
      questionPages.add(TestScreen(question));
    }
  }
}
