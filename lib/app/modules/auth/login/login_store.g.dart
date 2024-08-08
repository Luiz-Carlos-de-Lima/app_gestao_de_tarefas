// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$_isLoggedAtom =
      Atom(name: 'LoginStoreBase._isLogged', context: context);

  bool get isLogged {
    _$_isLoggedAtom.reportRead();
    return super._isLogged;
  }

  @override
  bool get _isLogged => isLogged;

  @override
  set _isLogged(bool value) {
    _$_isLoggedAtom.reportWrite(value, super._isLogged, () {
      super._isLogged = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
