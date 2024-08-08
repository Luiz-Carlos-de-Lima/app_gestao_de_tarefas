import 'package:app_gestao_de_tarefas/app/repositories/task/task_repository.dart';

import '../../models/task.dart';
import 'task_service.dart';

class TaskServiceImpl implements TaskService {
  final TaskRepository _repository;

  TaskServiceImpl({required TaskRepository repository}) : _repository = repository;

  @override
  Future<void> add({required Task task}) async {
    await _repository.add(task: task);
  }

  @override
  Future<List<Task>> getAll() async {
    return await _repository.getAll();
  }
}
