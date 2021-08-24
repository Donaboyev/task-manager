import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clone/controller/tasks_controller.dart';
import 'package:todo_clone/core/theme/app_colors.dart';

class SearchAppBarWidget extends GetView<TasksController>
    implements PreferredSizeWidget {
  final Function(String value)? onChanged;
  final TextEditingController? searchController;
  final VoidCallback? onLeadingTap;
  final VoidCallback? onClearTap;

  const SearchAppBarWidget({
    Key? key,
    this.onChanged,
    this.searchController,
    this.onLeadingTap,
    this.onClearTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksController>(
      builder: (tasksController) => AppBar(
        centerTitle: false,
        title: TextField(
          onChanged: onChanged,
          controller: searchController,
          style: new TextStyle(
            color: clrWhite,
          ),
          autofocus: true,
          decoration: new InputDecoration(
            hintText: "Search...",
            hintStyle: new TextStyle(color: clrWhite),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: onLeadingTap,
        ),
        actions: [
          TextButton(
            onPressed: onClearTap,
            child: Text(
              'Clear',
              style: TextStyle(color: clrWhite),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
