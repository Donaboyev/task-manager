import 'package:flutter/material.dart';
import 'package:todo_clone/core/theme/app_colors.dart';

class MobileIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const MobileIconButton(this.icon, {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      splashRadius: 24,
      splashColor: AppColors.clrWhite.withOpacity(0.1),
      icon: Icon(
        icon,
        color: AppColors.clrWhite,
      ),
    );
  }
}
