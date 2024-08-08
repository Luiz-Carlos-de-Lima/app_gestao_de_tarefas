import 'package:app_gestao_de_tarefas/app/core/stores/default_store.dart';
import 'package:app_gestao_de_tarefas/app/services/task/task_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../models/task.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase extends DefaultStore with Store {
  final _taskService = Modular.get<TaskService>();

  @readonly
  ObservableList<Task> _listTask = ObservableList();

  @action
  Future<void> getListTask() async {
    _listTask.clear();
    final listTask = await _taskService.getAll();

    _listTask.addAll(listTask);
  }

  @action
  void addNewTask({required Task newTask}) {
    _listTask.add(newTask);
  }
}
