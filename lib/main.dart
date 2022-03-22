import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todo_clone/binding/tasks_binding.dart';
import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/routes/app_pages.dart';
import 'package:todo_clone/routes/app_routes.dart';
import 'package:todo_clone/ui/home_screen.dart';
import 'package:todo_clone/ui/tasks/tasks_screen.dart';
import 'package:todo_clone/web_frame.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (AppConstants.running == Version.wait) await TasksBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      onGenerateRoute: (settings) => MaterialWithModalsPageRoute(
        builder: (_) => const HomeScreen(),
        settings: settings,
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:todo_clone/ui/modal_fit.dart';
// import 'package:todo_clone/ui/modal_with_scroll.dart';
// import 'package:todo_clone/web_frame.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(platform: TargetPlatform.iOS),
//       title: 'BottomSheet Modals',
//       builder: (context, Widget? child) => WebFrame(
//         child: child!,
//       ),
//       onGenerateRoute: (RouteSettings settings) {
//         debugPrint('=========> settings name: ${settings.name}');
//         return MaterialWithModalsPageRoute(
//           builder: (_) => const MyHomePage(title: 'Flutter Demo Home Page'),
//           settings: settings,
//         );
//       },
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Scaffold(
//         body: CupertinoPageScaffold(
//           child: Column(
//             children: <Widget>[
//               ListTile(
//                 title: const Text('Cupertino Modal fit'),
//                 onTap: () => showCupertinoModalBottomSheet(
//                   expand: false,
//                   context: context,
//                   backgroundColor: Colors.transparent,
//                   builder: (context) => const ModalFit(),
//                 ),
//               ),
//               ListTile(
//                 title: const Text('Cupertino Small Modal forced to expand'),
//                 onTap: () => showCupertinoModalBottomSheet(
//                   expand: true,
//                   context: context,
//                   backgroundColor: Colors.transparent,
//                   builder: (context) => const ModalFit(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.add),
//           onPressed: () {
//             showCupertinoModalBottomSheet(
//               expand: false,
//               context: context,
//               backgroundColor: Colors.transparent,
//               builder: (context) => const ModalFit(),
//             );
//           },
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//           shape: const CircularNotchedRectangle(),
//           child: Container(
//             height: 56,
//           ),
//         ),
//       ),
//     );
//   }
// }
