import 'package:fast_trivia/model/quiz.dart';
import 'package:mobx/mobx.dart';

part 'quiz_store.g.dart';

// ignore: library_private_types_in_public_api
class QuizStore = _QuizStore with _$QuizStore;

abstract class _QuizStore with Store {
  @observable
  Quiz? quiz;

  @observable
  int currentQuestionIndex = 0;

  @observable
  Map<int, int> answers = ObservableMap();

  @action
  void updateCurrentIndex(int index) {
    currentQuestionIndex = index;
  }

  @action
  void updateConfirmationScreen(Quiz quiz) {
    this.quiz = quiz;
  }

  @action
  void addAnswer(int questionIndex, int answer) {
    answers[questionIndex] = answer;
  }

  @action
  void clearAnswers() {
    answers.clear();
    currentQuestionIndex = 0;
  }
}
