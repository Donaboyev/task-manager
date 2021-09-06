import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:todo_clone/controller/tasks_controller.dart';
import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/core/theme/app_colors.dart';
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
            backgroundColor: clrWhite,
            appBar: !tasksController.isSearching
                ? AppBar(
                    backgroundColor: clrWhite,
                    elevation: 0,
                    title: const Text(
                      'Tasks',
                      style: styActionAppbar,
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(
                          Icons.search,
                          color: clrAccent,
                        ),
                        onPressed: () => tasksController.setIsSearching(true),
                      ),
                      PopupMenuButton<String>(
                        tooltip: 'Sorting types',
                        icon: const Icon(
                          Icons.sort,
                          color: clrAccent,
                        ),
                        itemBuilder: (context) {
                          return {
                            AppConstants.SORT_BY_NAME_TAG,
                            AppConstants.SORT_BY_DATE_TAG
                          }.map(
                            (choice) {
                              return PopupMenuItem<String>(
                                child: Text(
                                  choice,
                                  style: TextStyle(color: clrAccent),
                                ),
                                value: choice,
                              );
                            },
                          ).toList();
                        },
                        onSelected: (value) {
                          switch (value) {
                            case AppConstants.SORT_BY_NAME_TAG:
                              tasksController.setSortOrder(SortOrder.BY_NAME);
                              break;
                            case AppConstants.SORT_BY_DATE_TAG:
                              tasksController.setSortOrder(SortOrder.BY_DATE);
                              break;
                          }
                        },
                      ),
                      PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.more_vert,
                          color: clrAccent,
                        ),
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          PopupMenuItem<String>(
                            child: Row(
                              children: [
                                const Text(
                                  'Hide completed',
                                  style: stySearchText,
                                ),
                                Checkbox(
                                  activeColor: clrAccent,
                                  value: tasksController.hideCompleted.value,
                                  onChanged: (value) {
                                    tasksController.setHideCompleted();
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                            value: AppConstants.HIDE_COMPLETED_TAG,
                          ),
                          PopupMenuItem(
                            child: const Text(
                              'Delete all completed',
                              style: stySearchText,
                            ),
                            value: AppConstants.DELETE_ALL_COMPLETED_TAG,
                          ),
                        ],
                        onSelected: (value) {
                          switch (value) {
                            case AppConstants.HIDE_COMPLETED_TAG:
                              tasksController.setHideCompleted();
                              break;
                            case AppConstants.DELETE_ALL_COMPLETED_TAG:
                              showDialog(
                                context: context,
                                builder: (context) => AttentionDialog(
                                  onYesTap: () {
                                    tasksController.deleteCompletedTasks();
                                    Get.back();
                                  },
                                  onCancelTap: () => Get.back(),
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
                      tasksController.isClearButtonEnabled(false);
                      tasksController.getTasks();
                    },
                    searchController: tasksController.searchController,
                    clearButtonEnabled: tasksController.isSearching,
                  ),
            body: ListView.builder(
              padding: const EdgeInsets.only(bottom: 68),
              itemCount: tasksController.tasks.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (tasksController.tasks.isEmpty) return Container();
                var task = tasksController.tasks[index];
                return TaskItem(
                  task: task,
                  onCheck: (value) {
                    tasksController.updateTask(task, value);
                    tasksController.getTasks();
                  },
                  onSwiped: (direction) async {
                    bool deleted = false;
                    showDialog(
                      context: context,
                      builder: (context) => AttentionDialog(
                        title: 'Delete',
                        description: 'Do you really want to delete this task?',
                        onYesTap: () {
                          tasksController.deleteTask(task);
                          Get.back();
                          deleted = true;
                        },
                        onCancelTap: () {
                          Get.back();
                          deleted = false;
                        },
                      ),
                    );
                    return deleted;
                  },
                  onTaskTap: () =>
                      Get.toNamed(AppRoutes.ADD_EDIT, arguments: task),
                );
              },
            ),
            floatingActionButton: GetBuilder<TasksController>(
              builder: (homeController) => FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                  Get.toNamed(AppRoutes.ADD_EDIT);
                },
                backgroundColor: clrAccent,
                elevation: 0,
                highlightElevation: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
