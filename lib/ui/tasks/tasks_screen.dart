import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:todo_clone/controller/tasks_controller.dart';
import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/core/theme/app_text_styles.dart';
import 'package:todo_clone/routes/app_routes.dart';
import 'package:todo_clone/ui/tasks/widgets/attention_dialog.dart';
import 'package:todo_clone/ui/tasks/widgets/search_app_bar_widget.dart';
import 'package:todo_clone/ui/tasks/widgets/task_item_widget.dart';

class TasksPage extends GetView<TasksController> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: SafeArea(
        child: GetBuilder<TasksController>(
          builder: (tasksController) => Scaffold(
            appBar: !tasksController.isSearching
                ? AppBar(
                    title: Text(
                      'Tasks',
                      style: styActionAppbar,
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          tasksController.setIsSearching(true);
                        },
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(Icons.sort),
                        itemBuilder: (context) {
                          return {'Sort by name', 'Sort by date created'}.map(
                            (choice) {
                              return PopupMenuItem<String>(
                                child: Text(choice),
                                value: choice,
                              );
                            },
                          ).toList();
                        },
                        onSelected: (value) {
                          switch (value) {
                            case 'Sort by name':
                              tasksController.setSortOrder(SortOrder.BY_NAME);
                              break;
                            case 'Sort by date created':
                              tasksController.setSortOrder(SortOrder.BY_DATE);
                              break;
                          }
                        },
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          PopupMenuItem<String>(
                            child: Row(
                              children: [
                                Text('Hide completed'),
                                Checkbox(
                                  value: tasksController.hideCompleted.value,
                                  onChanged: (value) {
                                    tasksController.setHideCompleted();
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                            value: 'hide',
                          ),
                          PopupMenuItem(
                            child: Text('Delete all completed'),
                            value: 'delete all',
                          ),
                        ],
                        onSelected: (value) {
                          switch (value) {
                            case 'hide':
                              tasksController.setHideCompleted();
                              break;
                            case 'delete all':
                              showDialog(
                                context: context,
                                builder: (context) => AttentionDialog(
                                  onYesTap: () {
                                    tasksController.deleteCompletedTasks();
                                    Get.back();
                                  },
                                ),
                              );
                              break;
                          }
                        },
                      ),
                    ],
                  )
                : SearchAppBarWidget(
                    onChanged: (value) {
                      tasksController.getTasks();
                      tasksController.isClearButtonEnabled(
                        tasksController.searchController!.text
                            .trim()
                            .isNotEmpty,
                      );
                    },
                    onLeadingTap: () async {
                      await tasksController.setIsSearching(false);
                      tasksController.searchController!.clear();
                      tasksController.getTasks();
                    },
                    onClearTap: () {
                      tasksController.searchController!.clear();
                      tasksController.getTasks();
                    },
                    searchController: tasksController.searchController,
                    clearButtonEnabled: tasksController.isSearching,
                  ),
            body: ListView.builder(
              itemCount: tasksController.tasks.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (tasksController.tasks.isEmpty) return Container();
                var task = tasksController.tasks[index];
                return TaskItem(
                  task: task,
                  onCheck: (value) {
                    tasksController.updateTask(task, value);
                    tasksController.getTasks();
                  },
                );
              },
            ),
            floatingActionButton: GetBuilder<TasksController>(
              builder: (homeController) => FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {
                  Get.toNamed(AppRoutes.ADD_EDIT);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
