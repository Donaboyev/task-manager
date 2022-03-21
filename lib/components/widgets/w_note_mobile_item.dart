import 'package:flutter/material.dart';
import 'package:todo_clone/base/base_functions.dart';
import 'package:todo_clone/core/theme/app_colors.dart';
import 'package:todo_clone/core/theme/app_text_styles.dart';
import 'package:todo_clone/data/models/models.dart';

class WNoteMobileItem extends StatelessWidget {
  final Note note;

  const WNoteMobileItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4,
      ),
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: AppColors.clrWhite,
          border: Border.all(
            color: BaseFunctions.getPriorityColor(
              note.priority ?? 0,
            ),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title ?? '',
              style: AppStyles.styNoteTitleMobile,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              note.description ?? '',
              style: AppStyles.styNoteDescriptionMobile,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                note.date ?? '',
                style: AppStyles.styNoteDescriptionMobile,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
