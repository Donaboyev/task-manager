import 'package:get/get.dart';
import 'package:todo_clone/controller/add_edit_task_controller.dart';
import 'package:todo_clone/data/repository/tasks_repository.dart';

class AddEditTaskBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    var taskRepository = TasksRepository();
    Get.lazyPut<AddEditTaskController>(
      () => AddEditTaskController(taskRepository),
    );
  }
}
