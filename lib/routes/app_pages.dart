import 'package:get/get.dart';
import 'package:todo_clone/binding/tasks_binding.dart';
import 'package:todo_clone/routes/app_routes.dart';
import 'package:todo_clone/ui/tasks/tasks_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => TasksPage(),
      binding: TasksBinding(),
    ),
  ];
}
