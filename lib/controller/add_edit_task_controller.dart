import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';
import 'package:todo_clone/data/repository/tasks_repository.dart';

class AddEditTaskController extends GetxController {
  final TasksRepository? _repository;

  AddEditTaskController(this._repository);

  TextEditingController? taskInputController;
  RxBool _isImportant = false.obs;

  @override
  Future<void> onInit() async {
    taskInputController = TextEditingController();
    super.onInit();
  }

  @override
  Future<void> dispose() async {
    taskInputController!.dispose();
    super.dispose();
  }

  Future<void> setIsImportant(bool value) async {
    _isImportant.value = value;
    update();
  }

  Future<void> insertTask() async {
    await _repository!.insertTask(
      Task(
        name: taskInputController!.text.trim(),
        created: DateTime.now().millisecondsSinceEpoch,
        completed: false,
        important: _isImportant.value,
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

  bool get isImportant => _isImportant.value;
}
