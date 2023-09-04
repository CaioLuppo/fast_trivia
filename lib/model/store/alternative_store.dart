import 'package:fast_trivia/model/store/quiz_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'alternative_store.g.dart';

// ignore: library_private_types_in_public_api
class AlternativeStore = _AlternativeStore with _$AlternativeStore;

abstract class _AlternativeStore with Store {
  @observable
  int? selectedAlternative;

  @action
  void updateSelected(BuildContext context, int index, int questionId) {
    selectedAlternative = index;
    Provider.of<QuizStore>(context, listen: false).addAnswer(questionId, index);
  }
}
