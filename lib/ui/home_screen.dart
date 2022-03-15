import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_clone/core/theme/app_colors.dart';
import 'package:todo_clone/core/theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoScaffold(
        body: Builder(
          builder: (context) => CupertinoPageScaffold(
            child: Stack(
              children: [
                Column(
                  children: [
                    AppBar(
                      title: Text(
                        'Task manager',
                        style: AppStyles.styAppBarTitle,
                      ),
                      backgroundColor: AppColors.clrWhite,
                      elevation: 0,
                      actions: [
                        IconButton(
                          hoverColor: AppColors.clrTransparent,
                          padding: EdgeInsets.zero,
                          splashRadius: 16,
                          onPressed: () {
                            debugPrint('=> search button pressed');
                          },
                          icon: const Icon(
                            Icons.search,
                            color: AppColors.clrBlack,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      CupertinoScaffold.showCupertinoModalBottomSheet(
                        context: context,
                        // expand: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Material(
                          child: CupertinoPageScaffold(
                            child: Center(
                              child: Text('Add screen'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
