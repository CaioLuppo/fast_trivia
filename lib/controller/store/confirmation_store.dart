import 'package:mobx/mobx.dart';

part 'confirmation_store.g.dart';

// ignore: library_private_types_in_public_api
class ConfirmationStore = _ConfirmationStore with _$ConfirmationStore;

abstract class _ConfirmationStore with Store {
  @observable
  String title = "";

  @observable
  int questionsAmount = 0;

  @action
  void updateConfirmationScreen(String title, int questionsAmount) {
    this.questionsAmount = questionsAmount;
    this.title = title;
  }
}
