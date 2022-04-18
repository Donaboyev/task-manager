import 'package:flutter/material.dart';
import 'package:todo_clone/base/base_functions.dart';
import 'package:todo_clone/core/theme/app_colors.dart';
import 'package:todo_clone/core/theme/app_text_styles.dart';
import 'package:todo_clone/data/models/models.dart';

class WTaskMobileItem extends StatelessWidget {
  final Task task;

  const WTaskMobileItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: (value) {},
            ),
            Expanded(
              child: Column(
                children: [
                  Text(task.title ?? ''),
                  Text(task.description ?? ''),
                  Text(task.date ?? ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
