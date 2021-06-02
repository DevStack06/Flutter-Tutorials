import 'package:flutterapps/sqlite/dataModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'Test.db'),
      onCreate: (database, version) async {
        await database.execute(
          """CREATE TABLE MyTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            title TEXT NOT NULL,
            subtitle TEXT NOT NULL, 
           )""",
        );
      },
      version: 1,
    );
  }

  Future<int> insertData(DataModel data) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('MyTable', data.toMap());
    return result;
  }

  Future<List<DataModel>> getData() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('MyTable');
    return queryResult.map((e) => DataModel.fromMap(e)).toList();
  }

  Future<void> deletData(int id) async {
    final db = await initializeDB();
    await db.delete(
      'MyTable',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
