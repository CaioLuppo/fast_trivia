// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizStore on _QuizStore, Store {
  Computed<int>? _$correctAnswersComputed;

  @override
  int get correctAnswers =>
      (_$correctAnswersComputed ??= Computed<int>(() => super.correctAnswers,
              name: '_QuizStore.correctAnswers'))
          .value;
  Computed<double>? _$percentComputed;

  @override
  double get percent => (_$percentComputed ??=
          Computed<double>(() => super.percent, name: '_QuizStore.percent'))
      .value;

  late final _$quizAtom = Atom(name: '_QuizStore.quiz', context: context);

  @override
  Quiz? get quiz {
    _$quizAtom.reportRead();
    return super.quiz;
  }

  @override
  set quiz(Quiz? value) {
    _$quizAtom.reportWrite(value, super.quiz, () {
      super.quiz = value;
    });
  }

  late final _$currentQuestionIndexAtom =
      Atom(name: '_QuizStore.currentQuestionIndex', context: context);

  @override
  int get currentQuestionIndex {
    _$currentQuestionIndexAtom.reportRead();
    return super.currentQuestionIndex;
  }

  @override
  set currentQuestionIndex(int value) {
    _$currentQuestionIndexAtom.reportWrite(value, super.currentQuestionIndex,
        () {
      super.currentQuestionIndex = value;
    });
  }

  late final _$answersAtom = Atom(name: '_QuizStore.answers', context: context);

  @override
  Map<int, ObservableMap<int, int>> get answers {
    _$answersAtom.reportRead();
    return super.answers;
  }

  @override
  set answers(Map<int, ObservableMap<int, int>> value) {
    _$answersAtom.reportWrite(value, super.answers, () {
      super.answers = value;
    });
  }

  late final _$_QuizStoreActionController =
      ActionController(name: '_QuizStore', context: context);

  @override
  void updateCurrentIndex(int index) {
    final _$actionInfo = _$_QuizStoreActionController.startAction(
        name: '_QuizStore.updateCurrentIndex');
    try {
      return super.updateCurrentIndex(index);
    } finally {
      _$_QuizStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateConfirmationScreen(Quiz quiz) {
    final _$actionInfo = _$_QuizStoreActionController.startAction(
        name: '_QuizStore.updateConfirmationScreen');
    try {
      return super.updateConfirmationScreen(quiz);
    } finally {
      _$_QuizStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAnswer(int alternativeId, int answer) {
    final _$actionInfo =
        _$_QuizStoreActionController.startAction(name: '_QuizStore.addAnswer');
    try {
      return super.addAnswer(alternativeId, answer);
    } finally {
      _$_QuizStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quiz: ${quiz},
currentQuestionIndex: ${currentQuestionIndex},
answers: ${answers},
correctAnswers: ${correctAnswers},
percent: ${percent}
    ''';
  }
}
