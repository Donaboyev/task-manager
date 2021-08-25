import 'package:floor/floor.dart';
import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';

@dao
abstract class TasksDao {
  Future<List<Task>> getTasks(
    String query,
    SortOrder sortOrder,
    bool hideCompleted,
  ) =>
      sortOrder == SortOrder.BY_DATE
          ? getTasksSortedByDateCreated(query, hideCompleted)
          : getTasksSortedByName(query, hideCompleted);

  @Query(
      'SELECT * FROM Task WHERE (completed != :hideCompleted OR completed = 0) AND name LIKE :query ORDER BY important DESC, created')
  Future<List<Task>> getTasksSortedByDateCreated(
    String query,
    bool hideCompleted,
  );

  @Query(
      'SELECT * FROM Task WHERE (completed != :hideCompleted OR completed = 0) AND name LIKE :query ORDER BY important DESC, name')
  Future<List<Task>> getTasksSortedByName(String query, bool hideCompleted);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTask(Task task);

  @update
  Future<void> updateTask(Task task);

  @delete
  Future<void> deleteTask(Task task);
}
