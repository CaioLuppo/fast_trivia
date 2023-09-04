import 'package:mobx/mobx.dart';

part 'trivia_appbar_store.g.dart';

// ignore: library_private_types_in_public_api
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
