import 'package:moor_flutter/moor_flutter.dart';
import '../models/models.dart';

part 'app_db.g.dart';

class MoorNote extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get description => text()();

  TextColumn get date => text()();

  IntColumn get color => integer()();

  IntColumn get priority => integer()();
}

@UseMoor(tables: [MoorNote], daos: [NoteDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'notes.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [MoorNote])
class NoteDao extends DatabaseAccessor<AppDatabase> with _$NoteDaoMixin {
  final AppDatabase db;

  NoteDao(this.db) : super(db);

  Future<List<MoorNoteData>> findAllNotes() => select(moorNote).get();

  Stream<List<Note>> watchAllNotes() {
    return select(moorNote).watch().map(
      (rows) {
        final notes = <Note>[];
        for (var row in rows) {
            final note = moorNoteToNote(row);
            if (!notes.contains(note)) {
              notes.add(note);
            }
          }
        return notes;
      },
    );
  }

  Future<List<MoorNoteData>> findNoteById(int id) =>
      (select(moorNote)..where((tbl) => tbl.id.equals(id))).get();

  Future<int> insertNote(Insertable<MoorNoteData> note) => into(moorNote).insert(note);

  Future<bool> updateNote(Insertable<MoorNoteData> note) =>
      Future.value((update(moorNote).replace(note)));

  Future deleteNote(int id) =>
      Future.value((delete(moorNote)..where((tbl) => tbl.id.equals(id))).go());
}

// Conversion Methods
Note moorNoteToNote(MoorNoteData note) {
  return Note(
    id: note.id,
    title: note.title,
    description: note.description,
    date: note.date,
    color: note.color,
    priority: note.priority,
  );
}

Insertable<MoorNoteData> noteToInsertableMoorNote(Note note) {
  return MoorNoteCompanion.insert(
    title: note.title ?? '',
    description: note.description ?? '',
    date: note.date ?? '',
    color: note.color ?? 0,
    priority: note.priority ?? 0,
  );
}