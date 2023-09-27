// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReviewStore on _ReviewStore, Store {
  late final _$reviewingAtom =
      Atom(name: '_ReviewStore.reviewing', context: context);

  @override
  bool get reviewing {
    _$reviewingAtom.reportRead();
    return super.reviewing;
  }

  @override
  set reviewing(bool value) {
    _$reviewingAtom.reportWrite(value, super.reviewing, () {
      super.reviewing = value;
    });
  }

  late final _$_ReviewStoreActionController =
      ActionController(name: '_ReviewStore', context: context);

  @override
  void setReviewing(bool value) {
    final _$actionInfo = _$_ReviewStoreActionController.startAction(
        name: '_ReviewStore.setReviewing');
    try {
      return super.setReviewing(value);
    } finally {
      _$_ReviewStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reviewing: ${reviewing}
    ''';
  }
}
