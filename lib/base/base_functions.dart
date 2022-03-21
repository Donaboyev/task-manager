import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_clone/core/theme/app_colors.dart';

class BaseFunctions {
  static getCreatedDate(int createdDate) {
    DateTime parseDate = DateTime.fromMillisecondsSinceEpoch(createdDate);
    return DateFormat('dd MMM yyyy, hh:mm a').format(parseDate);
  }
  static Color getPriorityColor(int priority) {
    switch(priority) {
      case 0:
        return AppColors.clrGreen;
      case 1:
        return AppColors.clrYellow;
      case 2:
        return AppColors.clrRed;
      default:
        return AppColors.clrGreen;
    }
  }
}
