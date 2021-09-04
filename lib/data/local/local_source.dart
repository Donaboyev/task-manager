import 'package:get_storage/get_storage.dart';
import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/data/local/floor/app_database.dart';
import 'package:todo_clone/data/local/floor/dao/tasks_dao.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';

class LocalSource {
  var _localStorage = GetStorage();
  final TasksDao _taskDao = AppDatabase.instance.tasksDao;

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource? getInstance() {
    if (_instance != null) {
      return _instance;
    } else
      return LocalSource._();
  }

  Future<List<Task>> getTasks(
      String? searchQuery, SortOrder sortOrder, bool hideCompleted) {
    return _taskDao.getTasks(searchQuery!, sortOrder, hideCompleted);
  }

  Future<void> insertTask(Task task) async {
    await _taskDao.insertTask(task);
  }

  Future<void> updateTask(Task task) async {
    await _taskDao.updateTask(task);
  }

  Future<void> deleteAllCompletedTasks() async {
    await _taskDao.deleteCompletedTasks();
  }

  Future<void> setSortOrder(SortOrder sortOrder) async =>
      await _localStorage.write('sort_order', sortOrder.value);

  SortOrder getSortOrder() =>
      (_localStorage.read<String>('sort_order') ?? '') ==
              SortOrder.BY_DATE.value
          ? SortOrder.BY_DATE
          : SortOrder.BY_NAME;

  Future<void> setHideCompleted(bool value) async =>
      await _localStorage.write('hide_completed', value);

  bool getHideCompleted() =>
      _localStorage.read<bool>('hide_completed') ?? false;
}
