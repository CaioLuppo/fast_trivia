import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'trivia_appbar_store.g.dart';

class TriviaAppBarStore = _TriviaAppBarStore with _$TriviaAppBarStore;

abstract class _TriviaAppBarStore with Store {
  @observable
  bool showBackButton = false;

  @observable
  bool elevate = false;

  @action
  void updateProperties({
    bool? showBackButton,
    bool? elevate,
  }) {
    if (showBackButton != null) this.showBackButton = showBackButton;
    if (elevate != null) this.elevate = elevate;
  }
}
