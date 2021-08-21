import 'package:todo_clone/data/local/floor/entity/task.dart';
import 'package:todo_clone/data/local/local_source.dart';

class TasksRepository {
  final LocalSource? _localSource = LocalSource.getInstance();

  Stream<List<Task>> getTasks() {
    return _localSource!.getTasks();
  }

  Future<void> insertTask(Task task) async {
    await _localSource!.insertTask(task);
  }

  Future<void> updateTask(Task task) async {
    await _localSource!.updateTask(task);
  }
}
