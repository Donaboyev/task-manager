import 'package:get/get.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';
import 'package:todo_clone/data/repository/tasks_repository.dart';

class TasksController extends GetxController {
  final TasksRepository? _repository;

  TasksController(this._repository);

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Stream<List<Task>> getTasks() {
    return _repository!.getTasks();
  }

  Future<void> insertTask(Task task) async {
    await _repository!.insertTask(
      Task(
        name: task.name,
        created: DateTime.now().millisecondsSinceEpoch,
        completed: false,
        important: false,
      ),
    );
  }

  Future<void> updateTask(Task task, bool isChecked) async {
    Task newTask = Task(
      id: task.id,
      name: task.name,
      completed: isChecked,
      important: task.important,
      created: task.created,
    );
    await _repository!.updateTask(newTask);
    update();
  }
}
