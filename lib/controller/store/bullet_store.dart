import 'package:mobx/mobx.dart';

part 'bullet_store.g.dart';

// ignore: library_private_types_in_public_api
class BulletStore = _BulletStore with _$BulletStore;

abstract class _BulletStore with Store {
  @observable
  int activeIndex = 0;

  @action
  void updateActiveIndex(int index) {
    activeIndex = index;
  }
}
