import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:todo_clone/core/constants/app_constants.dart';
import 'package:todo_clone/data/local/floor/dao/tasks_dao.dart';
import 'package:todo_clone/data/local/floor/entity/task.dart';

part 'app_database.g.dart';

@Database(version: AppConstants.DATABASE_VERSION, entities: [Task])
abstract class AppDatabase extends FloorDatabase {
  TasksDao get tasksDao;

  static late AppDatabase instance;

  static Future<void> init() async {
    instance = await $FloorAppDatabase
        .databaseBuilder('todo_clone_database.db')
        .build();
  }
}
