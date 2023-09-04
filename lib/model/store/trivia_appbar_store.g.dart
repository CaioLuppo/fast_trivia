// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivia_appbar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TriviaAppBarStore on _TriviaAppBarStore, Store {
  late final _$showBackButtonAtom =
      Atom(name: '_TriviaAppBarStore.showBackButton', context: context);

  @override
  bool get showBackButton {
    _$showBackButtonAtom.reportRead();
    return super.showBackButton;
  }

  @override
  set showBackButton(bool value) {
    _$showBackButtonAtom.reportWrite(value, super.showBackButton, () {
      super.showBackButton = value;
    });
  }

  late final _$elevateAtom =
      Atom(name: '_TriviaAppBarStore.elevate', context: context);

  @override
  bool get elevate {
    _$elevateAtom.reportRead();
    return super.elevate;
  }

  @override
  set elevate(bool value) {
    _$elevateAtom.reportWrite(value, super.elevate, () {
      super.elevate = value;
    });
  }

  late final _$_TriviaAppBarStoreActionController =
      ActionController(name: '_TriviaAppBarStore', context: context);

  @override
  void updateProperties({bool? showBackButton, bool? elevate}) {
    final _$actionInfo = _$_TriviaAppBarStoreActionController.startAction(
        name: '_TriviaAppBarStore.updateProperties');
    try {
      return super
          .updateProperties(showBackButton: showBackButton, elevate: elevate);
    } finally {
      _$_TriviaAppBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showBackButton: ${showBackButton},
elevate: ${elevate}
    ''';
  }
}
