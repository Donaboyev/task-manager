import 'package:floor/floor.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';

@dao
abstract class TasksDao {
  @Query('SELECT * FROM Task')
  Stream<List<Task>> getTasks();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTask(Task task);

  @update
  Future<void> updateTask(Task task);

  @delete
  Future<void> deleteTask(Task task);
}
