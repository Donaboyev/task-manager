import 'package:todo_clone/data/local/floor/app_database.dart';
import 'package:todo_clone/data/local/floor/dao/tasks_dao.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';

class LocalSource {
  final TasksDao _taskDao = AppDatabase.instance.tasksDao;

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource? getInstance() {
    if (_instance != null) {
      return _instance;
    } else
      return LocalSource._();
  }

  Future<List<Task>> getTasks(String? searchQuery) {
    return _taskDao.getTasks(searchQuery!);
  }

  Future<void> insertTask(Task task) async {
    await _taskDao.insertTask(task);
  }

  Future<void> updateTask(Task task) async {
    await _taskDao.updateTask(task);
  }
}
