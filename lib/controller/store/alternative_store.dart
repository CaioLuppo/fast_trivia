import 'package:mobx/mobx.dart';

part 'alternative_store.g.dart';

// ignore: library_private_types_in_public_api
class AlternativeStore = _AlternativeStore with _$AlternativeStore;

abstract class _AlternativeStore with Store {
  @observable
  int? selectedAlternative;

  @action
  void updateSelected(int index) {
    selectedAlternative = index;
  }
}
