// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmationStore on _ConfirmationStore, Store {
  late final _$titleAtom =
      Atom(name: '_ConfirmationStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$questionsAmountAtom =
      Atom(name: '_ConfirmationStore.questionsAmount', context: context);

  @override
  int get questionsAmount {
    _$questionsAmountAtom.reportRead();
    return super.questionsAmount;
  }

  @override
  set questionsAmount(int value) {
    _$questionsAmountAtom.reportWrite(value, super.questionsAmount, () {
      super.questionsAmount = value;
    });
  }

  late final _$_ConfirmationStoreActionController =
      ActionController(name: '_ConfirmationStore', context: context);

  @override
  void updateConfirmationScreen(String title, int questionsAmount) {
    final _$actionInfo = _$_ConfirmationStoreActionController.startAction(
        name: '_ConfirmationStore.updateConfirmationScreen');
    try {
      return super.updateConfirmationScreen(title, questionsAmount);
    } finally {
      _$_ConfirmationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
questionsAmount: ${questionsAmount}
    ''';
  }
}
