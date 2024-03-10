import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/features/home_page/model/task.dart';

class DataBaseLocal {
  Future<Database> initializedDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'Task.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE Task(id TEXT PRIMARY KEY , title TEXT NOT NULL,description TEXT NOT NULL,completed BOOLEAN NOT NULL)",
        );
      },
    );
  }

  Future<int> insertTask(List<Task> Task) async {
    int result = 0;
    final Database db = await initializedDB();
    for (var task in Task) {
      result = await db.insert('Task', task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return result;
  }

  Future<List<Task>> retrieveTask() async {
    final Database db = await initializedDB();
    final List<Map<String, Object?>> queryResult = await db.query('Task');
    return queryResult.map((e) => Task.fromMap(e)).toList();
  }

  Future<void> deleteTask(String id) async {
    final db = await initializedDB();
    await db.delete(
      'Task',
      where: "id = $id",
      whereArgs: [id],
    );
  }

  Future<void> updateTask(int id) async {
    final db = await initializedDB();
    await db.delete(
      'Task',
      where: "id = $id",
      whereArgs: [id],
    );
  }
}
