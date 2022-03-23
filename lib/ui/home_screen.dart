import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_clone/base/base_functions.dart';
import 'package:todo_clone/components/bouncing/bouncing_physics.dart';
import 'package:todo_clone/components/buttons/floating_action_button.dart';
import 'package:todo_clone/components/buttons/mobile_icon_button.dart';
import 'package:todo_clone/components/cutom_bnb_painter.dart';
import 'package:todo_clone/components/widgets/w_note_mobile_item.dart';

import 'package:todo_clone/core/theme/app_colors.dart';
import 'package:todo_clone/core/theme/app_text_styles.dart';
import 'package:todo_clone/ui/modal_fit.dart';
import '../responsive.dart';
import '../data/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  ///SliverAppBar(
//                         shape: const RoundedRectangleBorder(
//                           side: BorderSide(
//                             color: AppColors.clrBlack,
//                             width: 1.5,
//                           ),
//                           borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(16),
//                             bottomRight: Radius.circular(16),
//                           ),
//                         ),
//                         floating: true,
//                         titleSpacing: 40,
//                         backgroundColor: AppColors.clrWhite,
//                         elevation: 1,
//                         title: Text(
//                           'Task manager',
//                           style: AppStyles.styAppBarTitle,
//                         ),
//                         actions: [
//                           IconButton(
//                             hoverColor: AppColors.clrTransparent,
//                             padding: EdgeInsets.zero,
//                             splashRadius: 16,
//                             onPressed: () {
//                               CupertinoScaffold.showCupertinoModalBottomSheet(
//                                 context: context,
//                                 // expand: true,
//                                 backgroundColor: Colors.transparent,
//                                 builder: (context) => const Material(
//                                   child: CupertinoPageScaffold(
//                                     child: Center(
//                                       child: Text('Search screen'),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                             icon: const Icon(
//                               Icons.search,
//                               color: AppColors.clrBlack,
//                             ),
//                           ),
//                           IconButton(
//                             hoverColor: AppColors.clrTransparent,
//                             padding: EdgeInsets.zero,
//                             splashRadius: 16,
//                             onPressed: () =>
//                                 CupertinoScaffold.showCupertinoModalBottomSheet(
//                               expand: false,
//                               context: context,
//                               backgroundColor: Colors.transparent,
//                               builder: (context) => const ModalFit(),
//                             ),
//                             icon: const Icon(
//                               Icons.sort,
//                               color: AppColors.clrBlack,
//                             ),
//                           ),
//                           IconButton(
//                             hoverColor: AppColors.clrTransparent,
//                             padding: EdgeInsets.zero,
//                             splashRadius: 16,
//                             onPressed: () =>
//                                 CupertinoScaffold.showCupertinoModalBottomSheet(
//                               expand: false,
//                               context: context,
//                               backgroundColor: Colors.transparent,
//                               builder: (context) => const ModalFit(),
//                             ),
//                             icon: const Icon(
//                               Icons.more_vert,
//                               color: AppColors.clrBlack,
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                         ],
//                       ),
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.clrAccent.withOpacity(0.9)
      ),
      child: Material(
        child: Scaffold(
          body: CupertinoPageScaffold(
            child: ListView.builder(
              itemCount: staticNotes.length,
              itemBuilder: (context, index) {
                final note = staticNotes[index];
                return WNoteMobileItem(note: note);
              },
            ),
          ),
          floatingActionButton: CustomFloatingActionButton(
            Icons.add,
            onPressed: () {
              showCupertinoModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => const ModalFit(),
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: AppColors.clrAccent,
            child: Container(
              color: AppColors.clrTransparent,
              height: 64,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MobileIconButton(
                      Icons.sort,
                      onPressed: () {
                        showCupertinoModalBottomSheet(
                          expand: false,
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const ModalFit(),
                        );
                      },
                    ),
                    Row(
                      children: [
                        MobileIconButton(
                          Icons.search,
                          onPressed: () {
                            showCupertinoModalBottomSheet(
                              expand: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const ModalFit(),
                            );
                          },
                        ),
                        const SizedBox(width: 24),
                        MobileIconButton(
                          Icons.more_vert,
                          onPressed: () {
                            showCupertinoModalBottomSheet(
                              expand: false,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const ModalFit(),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
