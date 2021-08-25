import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';
import 'package:todo_clone/data/local/local_source.dart';

class TasksRepository {
  final LocalSource? _localSource = LocalSource.getInstance();

  Future<List<Task>> getTasks(
      String? searchQuery, SortOrder sortOrder, bool hideCompleted) {
    return _localSource!.getTasks(searchQuery, sortOrder, hideCompleted);
  }

  Future<void> insertTask(Task task) async {
    await _localSource!.insertTask(task);
  }

  Future<void> updateTask(Task task) async {
    await _localSource!.updateTask(task);
  }
}
