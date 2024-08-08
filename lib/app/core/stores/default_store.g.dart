// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DefaultStore on DefaultStoreBase, Store {
  late final _$statusLoaderAtom =
      Atom(name: 'DefaultStoreBase.statusLoader', context: context);

  @override
  LoaderStatus get statusLoader {
    _$statusLoaderAtom.reportRead();
    return super.statusLoader;
  }

  @override
  set statusLoader(LoaderStatus value) {
    _$statusLoaderAtom.reportWrite(value, super.statusLoader, () {
      super.statusLoader = value;
    });
  }

  late final _$DefaultStoreBaseActionController =
      ActionController(name: 'DefaultStoreBase', context: context);

  @override
  void showLoader() {
    final _$actionInfo = _$DefaultStoreBaseActionController.startAction(
        name: 'DefaultStoreBase.showLoader');
    try {
      return super.showLoader();
    } finally {
      _$DefaultStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void hideLoader() {
    final _$actionInfo = _$DefaultStoreBaseActionController.startAction(
        name: 'DefaultStoreBase.hideLoader');
    try {
      return super.hideLoader();
    } finally {
      _$DefaultStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
statusLoader: ${statusLoader}
    ''';
  }
}
