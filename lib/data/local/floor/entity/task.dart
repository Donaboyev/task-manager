import 'package:floor/floor.dart';

@entity
class Task {
  @primaryKey
  final int? id;
  final String? name;
  final bool? important;
  final bool? completed;
  final int? created;

  Task({
    this.id,
    this.name,
    this.important,
    this.completed,
    this.created,
  });
}
