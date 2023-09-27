import 'package:fast_trivia/model/question.dart';
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
  Map<int, ObservableMap<int, int>> answers = ObservableMap();

  @computed
  int get correctAnswers {
    int count = 0;
    for (Question element in quiz!.questions) {
      bool correct = element.answer == answers[quiz!.id]![element.id];
      if (correct) count++;
    }
    return count;
  }

  @computed
  double get percent {
    return 100 * correctAnswers / quiz!.questions.length;
  }

  @action
  void updateCurrentIndex(int index) {
    currentQuestionIndex = index;
  }

  @action
  void updateConfirmationScreen(Quiz quiz) {
    this.quiz = quiz;
  }

  @action
  void addAnswer(int alternativeId, int answer) {
    if (answers[quiz!.id] != null) {
      answers[quiz!.id]![alternativeId] = answer;
    } else {
      answers[quiz!.id] = ObservableMap.of({alternativeId: answer});
    }
  }

  bool isCorrect(int answerIndex) {
    final question = quiz!.questions[answerIndex];
    final actualAnswer = answers[quiz!.id]![question.id];
    return question.answer == actualAnswer;
  }
}
