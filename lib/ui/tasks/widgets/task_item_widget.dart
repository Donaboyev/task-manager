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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Container(
            decoration: BoxDecoration(
              border:
                  Border.all(color: task!.important! ? clrSindre : clrGrayer),
              borderRadius: BorderRadius.circular(12),
              color: task!.important! ? clrRedHint : clrBreakerHint,
            ),
            child: Column(
              children: [
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Checkbox(
                              shape: CircleBorder(),
                              value: task!.completed,
                              onChanged: (value) => onCheck!(value!),
                              activeColor:
                                  task!.important! ? clrRed : clrBreaker,
                              side: BorderSide(
                                color: task!.important! ? clrRed : clrBreaker,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  task!.name ?? '',
                                  style: task!.completed!
                                      ? (task!.important!
                                          ? styCompletedImportantTaskTitle
                                          : styCompletedTaskTitle)
                                      : (task!.important!
                                          ? styImportantTaskTitle
                                          : styTaskTitle),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      task!.important!
                          ? Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.notification_important_sharp,
                                color: clrRed,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
