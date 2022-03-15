import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clone/binding/tasks_binding.dart';
import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/routes/app_pages.dart';
import 'package:todo_clone/routes/app_routes.dart';
import 'package:todo_clone/ui/tasks/tasks_screen.dart';

import 'routes/app_router.gr.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (AppConstants.running == Version.wait) await TasksBinding().dependencies();
  final appRouter = AppRouter();
  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
