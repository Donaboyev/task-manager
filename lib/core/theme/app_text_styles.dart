import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_clone/core/theme/app_colors.dart';

class AppStyles {
  static const styActionAppbar = TextStyle(
    color: AppColors.clrAccent,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const styNoData = TextStyle(
    color: AppColors.clrGrayBlue,
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const styCompletedTaskTitle = TextStyle(
    color: AppColors.clrGrayBlue,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.lineThrough,
  );

  static const styCompletedImportantTaskTitle = TextStyle(
    color: AppColors.clrRed,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.lineThrough,
  );

  static const styImportantTaskTitle = TextStyle(
    color: AppColors.clrRed,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static const styTaskTitle = TextStyle(
    color: AppColors.clrBreaker,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static const styImportantNotes = TextStyle(
    color: AppColors.clrAccent,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const styDialogTitle = TextStyle(
    color: AppColors.clrAccent,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const styDialogDescription = TextStyle(
    color: AppColors.clrGrayBlue,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const stySearchText = TextStyle(color: AppColors.clrAccent);

  static const stySearchHint = TextStyle(color: AppColors.clrGrayBlue);

  static TextStyle styAppBarTitle = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.clrBlack,
      fontSize: 20,
    ),
  );
}
