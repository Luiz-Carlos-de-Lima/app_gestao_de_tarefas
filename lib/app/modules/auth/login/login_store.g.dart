// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$_isLogedAtom =
      Atom(name: 'LoginStoreBase._isLoged', context: context);

  bool get isLoged {
    _$_isLogedAtom.reportRead();
    return super._isLoged;
  }

  @override
  bool get _isLoged => isLoged;

  @override
  set _isLoged(bool value) {
    _$_isLogedAtom.reportWrite(value, super._isLoged, () {
      super._isLoged = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
