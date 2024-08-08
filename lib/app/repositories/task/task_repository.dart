import '../../models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getAll();
  Future<void> add({required Task task});
}
