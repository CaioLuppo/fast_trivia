// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QuizStore on _QuizStore, Store {
  Computed<List<Widget>>? _$pagesComputed;

  @override
  List<Widget> get pages => (_$pagesComputed ??=
          Computed<List<Widget>>(() => super.pages, name: '_QuizStore.pages'))
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

  late final _$questionPagesAtom =
      Atom(name: '_QuizStore.questionPages', context: context);

  @override
  ObservableList<TestScreen> get questionPages {
    _$questionPagesAtom.reportRead();
    return super.questionPages;
  }

  @override
  set questionPages(ObservableList<TestScreen> value) {
    _$questionPagesAtom.reportWrite(value, super.questionPages, () {
      super.questionPages = value;
    });
  }

  late final _$_QuizStoreActionController =
      ActionController(name: '_QuizStore', context: context);

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
  void updateQuestionsScreen() {
    final _$actionInfo = _$_QuizStoreActionController.startAction(
        name: '_QuizStore.updateQuestionsScreen');
    try {
      return super.updateQuestionsScreen();
    } finally {
      _$_QuizStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quiz: ${quiz},
questionPages: ${questionPages},
pages: ${pages}
    ''';
  }
}
