import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:todo_clone/controller/tasks_controller.dart';
import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/core/theme/app_text_styles.dart';
import 'package:todo_clone/routes/app_routes.dart';
import 'package:todo_clone/ui/tasks/widgets/search_app_bar_widget.dart';
import 'package:todo_clone/ui/tasks/widgets/task_item_widget.dart';

class TasksPage extends GetView<TasksController> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: SafeArea(
        child: GetBuilder<TasksController>(
          builder: (homeController) => Scaffold(
            appBar: !homeController.isSearching
                ? AppBar(
                    title: Text(
                      'Todo clone',
                      style: styActionAppbar,
                    ),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          homeController.setIsSearching(true);
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
                              homeController.setSortOrder(SortOrder.BY_NAME);
                              break;
                            case 'Sort by date created':
                              homeController.setSortOrder(SortOrder.BY_DATE);
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
                                  value: homeController.hideCompleted.value,
                                  onChanged: (value) {
                                    homeController.setHideCompleted();
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
                              homeController.setHideCompleted();
                              break;
                            case 'delete all':
                              homeController.setSortOrder(SortOrder.BY_DATE);
                              break;
                          }
                        },
                      ),
                    ],
                  )
                : SearchAppBarWidget(
                    onChanged: (value) {
                      homeController.getTasks();
                    },
                    onLeadingTap: () async {
                      await homeController.setIsSearching(false);
                      homeController.searchController!.clear();
                      homeController.getTasks();
                    },
                    onClearTap: () {
                      homeController.searchController!.clear();
                      homeController.getTasks();
                    },
                    searchController: homeController.searchController,
                  ),
            body: ListView.builder(
              itemCount: homeController.tasks.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (homeController.tasks.isEmpty) return Container();
                var task = homeController.tasks[index];
                return TaskItem(
                  task: task,
                  onCheck: (value) {
                    homeController.updateTask(task, value);
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
