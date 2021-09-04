import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:todo_clone/controller/add_edit_task_controller.dart';
import 'package:todo_clone/controller/tasks_controller.dart';
import 'package:todo_clone/core/theme/app_colors.dart';
import 'package:todo_clone/core/theme/app_text_styles.dart';

class AddEditTaskPage extends GetView<AddEditTaskController> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: SafeArea(
        child: GetBuilder<AddEditTaskController>(
          builder: (addEditController) => Scaffold(
            backgroundColor: clrWhite,
            appBar: AppBar(
              backgroundColor: clrWhite,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: clrBreaker,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Text(
                'New task',
                style: styActionAppbar,
              ),
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
                      Obx(
                        () => Checkbox(
                          value: addEditController.isImportant,
                          onChanged: (value) {
                            addEditController.setIsImportant(value ?? false);
                          },
                        ),
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
