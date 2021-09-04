import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clone/core/theme/app_colors.dart';

class AttentionDialog extends StatelessWidget {
  final VoidCallback? onYesTap;

  AttentionDialog({
    Key? key,
    this.onYesTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Confirm deletion',
              style: TextStyle(
                color: clrBlack,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Do you really want to delete all completed tasks?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: clrDivider,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextButton(
                    onPressed: onYesTap,
                    child: Text('Yes'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
