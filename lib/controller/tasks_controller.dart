import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';
import 'package:todo_clone/data/repository/tasks_repository.dart';

class TasksController extends GetxController {
  final TasksRepository? _repository;

  TasksController(this._repository);

  RxBool _isSearching = false.obs;
  TextEditingController? searchController;
  List<Task>? _tasks;
  RxBool _hideCompleted = false.obs;
  SortOrder? _sortOrder;

  @override
  Future<void> onInit() async {
    searchController = TextEditingController();
    _sortOrder = SortOrder.BY_DATE;
    getTasks();
    super.onInit();
  }

  @override
  Future<void> dispose() async {
    searchController!.dispose();
    super.dispose();
  }

  Future<void> setIsSearching(bool value) async {
    _isSearching.value = value;
    update();
  }

  Future<void> setSortOrder(SortOrder order) async {
    if (order == _sortOrder) return;
    _sortOrder = order;
    getTasks();
  }

  Future<void> setHideCompleted() async {
    _hideCompleted.value = !_hideCompleted.value;
    getTasks();
  }

  Future<void> getTasks() async {
    _tasks = await _repository!.getTasks(
      '%${searchController!.text.toString().trim()}%',
      _sortOrder!,
      _hideCompleted.value,
    );
    update();
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

  bool get isSearching => _isSearching.value;

  RxBool get hideCompleted => _hideCompleted;

  List<Task> get tasks => _tasks!;
}
