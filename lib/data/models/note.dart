import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Note extends Equatable {
  int? id;
  final String? title;
  final String? description;
  final String? date;
  final int? color;
  final int? priority;

  Note({
    this.id,
    this.title,
    this.description,
    this.date,
    this.color,
    this.priority,
  });

  Note copyWith({
    int? id,
    String? title,
    String? description,
    String? date,
    int? color,
    int? priority,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        color: color ?? this.color,
        priority: priority ?? this.priority,
      );

  @override
  List<Object?> get props => [
        title,
        description,
        date,
        color,
        priority,
      ];

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['noteId'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
        color: json['color'],
        priority: json['priority'],
      );

  Map<String, dynamic> toJson() => {
        'noteId': id,
        'title': title,
        'description': description,
        'date': date,
        'color': color,
        'priority': priority,
      };
}

final List<Note> staticNotes = [
  Note(
    id: 0,
    title: 'First note kijfdjfklsjdlkjsdflkjkldsfjkls fsjfklsdjflkdjsflkjsdlkfjsdklfjdsklf fdjsfkdslkfjlksdjfklds|',
    description: 'First note description',
    date: '2022-12-05',
    color: 0,
    priority: 0,
  ),
  Note(
    id: 1,
    title: 'Second note',
    description: 'Second note description',
    date: '2022-12-05',
    color: 0,
    priority: 0,
  ),
  Note(
    id: 2,
    title: 'Third note',
    description: 'Third note description',
    date: '2022-12-05',
    color: 1,
    priority: 1,
  ),
  Note(
    id: 3,
    title: 'Fourth note',
    description: 'Fourth note description',
    date: '2022-12-05',
    color: 2,
    priority: 2,
  ),
  Note(
    id: 4,
    title: 'Fifth note',
    description: 'Fifth note description',
    date: '2022-12-05',
    color: 2,
    priority: 2,
  ),
  Note(
    id: 5,
    title: 'Sixth note',
    description: 'Sixth note description',
    date: '2022-12-05',
    color: 2,
    priority: 2,
  ),
  Note(
    id: 6,
    title: 'Seventh note',
    description: 'Seventh note description',
    date: '2022-12-05',
    color: 2,
    priority: 2,
  ),
  Note(
    id: 7,
    title: 'Eighth note',
    description: 'Eighth note description',
    date: '2022-12-05',
    color: 2,
    priority: 2,
  ),
  Note(
    id: 8,
    title: 'Ninth note',
    description: 'Ninth note description',
    date: '2022-12-05',
    color: 2,
    priority: 2,
  ),
  Note(
    id: 9,
    title: 'Tenth note',
    description: 'Tenth note description',
    date: '2022-12-05',
    color: 2,
    priority: 2,
  ),
];
