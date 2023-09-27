import 'package:mobx/mobx.dart';

part 'review_store.g.dart';

// ignore: library_private_types_in_public_api
class ReviewStore = _ReviewStore with _$ReviewStore;

abstract class _ReviewStore with Store {
  @observable
  bool reviewing = false;

  @action
  void setReviewing(bool value) => reviewing = value;
}
