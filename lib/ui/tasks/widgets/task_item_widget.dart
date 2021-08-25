import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clone/controller/tasks_controller.dart';
import 'package:todo_clone/core/theme/app_colors.dart';
import 'package:todo_clone/core/theme/app_text_styles.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';

class TaskItem extends GetView<TasksController> {
  final Task? task;
  final Function(bool value)? onCheck;

  const TaskItem({Key? key, this.task, this.onCheck}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksController>(
      builder: (tasksController) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: clrTransparent,
          ),
          child: Column(
            children: [
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: task!.completed,
                          onChanged: (value) => onCheck!(value!),
                        ),
                        Text(
                          task!.name ?? '',
                          style: task!.completed!
                              ? styCompletedTaskTitle
                              : styUnCompletedTaskTitle,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    task!.important!
                        ? Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.notification_important_sharp),
                          )
                        : Container(),
                  ],
                ),
              ),
              Container(
                height: 1,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: clrAsset,
              )
            ],
          ),
        );
      },
    );
  }
}
