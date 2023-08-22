// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bullet_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BulletStore on _BulletStore, Store {
  late final _$activeIndexAtom =
      Atom(name: '_BulletStore.activeIndex', context: context);

  @override
  int get activeIndex {
    _$activeIndexAtom.reportRead();
    return super.activeIndex;
  }

  @override
  set activeIndex(int value) {
    _$activeIndexAtom.reportWrite(value, super.activeIndex, () {
      super.activeIndex = value;
    });
  }

  late final _$_BulletStoreActionController =
      ActionController(name: '_BulletStore', context: context);

  @override
  void updateActiveIndex(int index) {
    final _$actionInfo = _$_BulletStoreActionController.startAction(
        name: '_BulletStore.updateActiveIndex');
    try {
      return super.updateActiveIndex(index);
    } finally {
      _$_BulletStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeIndex: ${activeIndex}
    ''';
  }
}
