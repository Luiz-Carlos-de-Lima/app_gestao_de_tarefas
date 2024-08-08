// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$_listTaskAtom =
      Atom(name: 'HomeStoreBase._listTask', context: context);

  ObservableList<Task> get listTask {
    _$_listTaskAtom.reportRead();
    return super._listTask;
  }

  @override
  ObservableList<Task> get _listTask => listTask;

  @override
  set _listTask(ObservableList<Task> value) {
    _$_listTaskAtom.reportWrite(value, super._listTask, () {
      super._listTask = value;
    });
  }

  late final _$getListTaskAsyncAction =
      AsyncAction('HomeStoreBase.getListTask', context: context);

  @override
  Future<void> getListTask() {
    return _$getListTaskAsyncAction.run(() => super.getListTask());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void addNewTask({required Task newTask}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.addNewTask');
    try {
      return super.addNewTask(newTask: newTask);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
