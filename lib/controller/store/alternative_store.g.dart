// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alternative_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlternativeStore on _AlternativeStore, Store {
  late final _$selectedAlternativeAtom =
      Atom(name: '_AlternativeStore.selectedAlternative', context: context);

  @override
  int? get selectedAlternative {
    _$selectedAlternativeAtom.reportRead();
    return super.selectedAlternative;
  }

  @override
  set selectedAlternative(int? value) {
    _$selectedAlternativeAtom.reportWrite(value, super.selectedAlternative, () {
      super.selectedAlternative = value;
    });
  }

  late final _$_AlternativeStoreActionController =
      ActionController(name: '_AlternativeStore', context: context);

  @override
  void updateSelected(int index) {
    final _$actionInfo = _$_AlternativeStoreActionController.startAction(
        name: '_AlternativeStore.updateSelected');
    try {
      return super.updateSelected(index);
    } finally {
      _$_AlternativeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedAlternative: ${selectedAlternative}
    ''';
  }
}
