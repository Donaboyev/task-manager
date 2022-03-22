import 'package:flutter/material.dart';
import 'package:todo_clone/core/theme/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const CustomFloatingActionButton(
    this.icon, {
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.clrAccent,
      elevation: 10,
      highlightElevation: 10,
      hoverElevation: 10,
      focusElevation: 10,
      splashColor: AppColors.clrWhite.withOpacity(0.1),
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}
