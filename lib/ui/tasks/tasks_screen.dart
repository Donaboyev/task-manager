import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:todo_clone/controller/tasks_controller.dart';
import 'package:todo_clone/core/theme/app_colors.dart';
import 'package:todo_clone/core/theme/app_text_styles.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';
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
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: clrAsset),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                    ),
                    title: Text(
                      'Todo clone',
                      style: styActionAppbar,
                    ),
                    centerTitle: true,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () async {
                          await homeController.setIsSearching(true);
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
            body: Stack(
              children: [
                ListView.builder(
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
              ],
            ),
            floatingActionButton: GetBuilder<TasksController>(
              builder: (homeController) => FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
