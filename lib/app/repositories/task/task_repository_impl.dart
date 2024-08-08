import 'package:app_gestao_de_tarefas/app/core/data/data_service.dart';

import '../../models/task.dart';
import 'task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final DataService _dataService;

  TaskRepositoryImpl({required DataService dataService}) : _dataService = dataService;

  @override
  Future<List<Task>> getAll() async {
    final List<Map> listTaskMap = await _dataService.get(route: 'task');
    final List<Task> listTask = [];
    for (final taskMap in listTaskMap) {
      Task task = Task.fromJson(mapTask: taskMap);
      listTask.add(task);
    }

    return listTask;
  }

  @override
  Future<void> add({required Task task}) async {
    await _dataService.post(route: 'task', data: task.toJson());
  }
}
