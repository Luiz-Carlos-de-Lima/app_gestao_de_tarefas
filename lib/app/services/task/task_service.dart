import '../../models/task.dart';

abstract class TaskService {
  Future<List<Task>> getAll();
  Future<void> add({required Task task});
}
