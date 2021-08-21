import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_clone/binding/tasks_binding.dart';
import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/routes/app_pages.dart';
import 'package:todo_clone/routes/app_routes.dart';
import 'package:todo_clone/ui/tasks/tasks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (AppConstants.running == Version.wait) await TasksBinding().dependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.INITIAL,
      getPages: AppPages.pages,
      home: TasksPage(),
    );
  }
}
