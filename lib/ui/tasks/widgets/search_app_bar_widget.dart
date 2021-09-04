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
  final bool? clearButtonEnabled;

  const SearchAppBarWidget({
    Key? key,
    this.onChanged,
    this.searchController,
    this.onLeadingTap,
    this.onClearTap,
    this.clearButtonEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TasksController>(
      builder: (tasksController) => AppBar(
        backgroundColor: clrWhite,
        elevation: 0,
        centerTitle: false,
        title: TextField(
          onChanged: onChanged,
          controller: searchController,
          style: new TextStyle(
            color: clrBreaker,
          ),
          autofocus: true,
          cursorColor: clrBreaker,
          decoration: new InputDecoration(
            hintText: "Search...",
            hintStyle: new TextStyle(color: clrGrayer),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: clrTransparent),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: clrTransparent),
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: clrBreaker,
          ),
          onPressed: onLeadingTap,
        ),
        actions: [
          Obx(
            () => Visibility(
              visible: controller.clearButtonEnabled,
              child: TextButton(
                onPressed: onClearTap,
                child: Text(
                  'Clear',
                  style: TextStyle(color: clrBreaker),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
