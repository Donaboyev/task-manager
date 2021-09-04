import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:todo_clone/controller/add_edit_task_controller.dart';
import 'package:todo_clone/controller/tasks_controller.dart';

class AddEditTaskPage extends GetView<AddEditTaskController> {
  const AddEditTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: SafeArea(
        child: GetBuilder<AddEditTaskController>(
          builder: (addEditController) => Scaffold(
            appBar: AppBar(
              title: Text('New task'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: addEditController.taskInputController,
                    decoration: InputDecoration(hintText: 'Task name'),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text('Important task'),
                    ],
                  ),
                  Visibility(
                    child: Text('Created: '),
                    visible: true,
                  ),
                ],
              ),
            ),
            floatingActionButton: GetBuilder<TasksController>(
              builder: (tasksController) => FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () {
                  addEditController.insertTask();
                  Get.back();
                  tasksController.getTasks();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
