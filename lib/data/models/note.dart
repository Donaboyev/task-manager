import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  int? id;
  final String? title;
  final String? description;
  final String? date;
  final int? color;
  final bool? isDone;

  Task({
    this.id,
    this.title,
    this.description,
    this.date,
    this.color,
    this.isDone,
  });

  Task copyWith({
    int? id,
    String? title,
    String? description,
    String? date,
    int? color,
    bool? isDone,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        color: color ?? this.color,
        isDone: isDone ?? this.isDone,
      );

  @override
  List<Object?> get props => [
        title,
        description,
        date,
        color,
        isDone,
      ];

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['taskId'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
        color: json['color'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'taskId': id,
        'title': title,
        'description': description,
        'date': date,
        'color': color,
        'isDone': isDone,
      };
}

final List<Task> staticNotes = [
  Task(
    id: 0,
    title:
        'First note kijfdjfklsjdlkjsdflkjkldsfjkls fsjfklsdjflkdjsflkjsdlkfjsdklfjdsklf fdjsfkdslkfjlksdjfklds|',
    description: 'First note description',
    date: '2022-12-05',
    color: 0,
    isDone: false,
  ),
  Task(
    id: 1,
    title: 'Second note',
    description: 'Second note description',
    date: '2022-12-05',
    color: 0,
    isDone: true,
  ),
  Task(
    id: 2,
    title: 'Third note',
    description: 'Third note description',
    date: '2022-12-05',
    color: 1,
    isDone: false,
  ),
  Task(
    id: 3,
    title: 'Fourth note',
    description: 'Fourth note description',
    date: '2022-12-05',
    color: 2,
    isDone: true,
  ),
  Task(
    id: 4,
    title: 'Fifth note',
    description: 'Fifth note description',
    date: '2022-12-05',
    color: 2,
    isDone: false,
  ),
  Task(
    id: 5,
    title: 'Sixth note',
    description: 'Sixth note description',
    date: '2022-12-05',
    color: 2,
    isDone: true,
  ),
  Task(
    id: 6,
    title: 'Seventh note',
    description: 'Seventh note description',
    date: '2022-12-05',
    color: 2,
    isDone: true,
  ),
  Task(
    id: 7,
    title: 'Eighth note',
    description: 'Eighth note description',
    date: '2022-12-05',
    color: 2,
    isDone: false,
  ),
  Task(
    id: 8,
    title: 'Ninth note',
    description: 'Ninth note description',
    date: '2022-12-05',
    color: 2,
    isDone: false,
  ),
  Task(
    id: 9,
    title: 'Tenth note',
    description: 'Tenth note description',
    date: '2022-12-05',
    color: 2,
    isDone: false,
  ),
];
